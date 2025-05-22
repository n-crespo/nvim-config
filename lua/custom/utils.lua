local M = {}

---@diagnostic disable: undefined-field
local uv = vim.loop
local api = vim.api
local fn = vim.fn

--- Get the parent directory of a buffer's file.
--- Returns nil if the buffer has no associated filepath.
---
--- @param bufnr number Buffer number to inspect
--- @return string|nil Absolute path to the buffer's directory, or nil
local function buf_dir(bufnr)
  local name = api.nvim_buf_get_name(bufnr)
  if name ~= "" then
    -- make it absolute and strip to the parent directory
    return fn.fnamemodify(name, ":p:h")
  end
end

--- Select the first valid directory from a list of candidates.
--- A directory is valid if it's non-empty and, if filename is provided,
--- the file exists in that directory.
---
--- @param candidates (string|nil)[] List of directory paths to try in order
--- @param filename string Filename to check existence (optional)
--- @return string|nil First directory that passes checks, or nil
local function pick_dir(candidates, filename)
  for _, d in ipairs(candidates) do
    if type(d) == "string" and d ~= "" then
      if filename == "" or uv.fs_stat(d .. "/" .. filename) then
        return d
      end
    end
  end
end

--- Determines a directory based on buffer context, with fallbacks.
---
--- Priority order:
---   1. Current buffer's directory (if file-backed)
---   2. Alternate buffer's directory (#) (if valid)
---   3. Current working directory
---
--- If a filename is provided, appends it only if that file exists.
--- Otherwise returns just the directory.
---
--- @param filename string? Optional filename to append to the directory
--- @return string Absolute path to the chosen directory or file path
function M.get_dir_with_fallback(filename)
  filename = filename or ""

  -- Candidate 1: current buffer dir (nil if no file)
  local cur_dir = buf_dir(0)

  -- Candidate 2: alternate buffer dir (#), or nil
  local alt_bufnr = fn.bufnr("#")
  local alt_dir = nil
  if api.nvim_buf_is_valid(alt_bufnr) then
    alt_dir = buf_dir(alt_bufnr)
  end

  -- Candidate 3: fallback to cwd
  local cwd = uv.cwd()

  -- Pick the first that exists (and matches filename, if any)
  local dir = pick_dir({ cur_dir, alt_dir, cwd }, filename) or cwd

  -- If filename provided and the file exists, return full path
  if filename ~= "" then
    local full = dir .. "/" .. filename
    if uv.fs_stat(full) then
      return full
    end
  end

  -- Otherwise just return the directory
  return dir
end

-- returns true if neovim has been started as a man pager
function M.is_man_pager()
  for _, arg in ipairs(vim.v.argv) do
    if arg == "+Man!" then
      return true
    end
  end
  return false
end

-- gf and gx all in one, with markdown support
-- if `tab` is true, open link in new tab
function M.follow_link(tab)
  tab = tab or false
  local ecmd = tab and "tabe " or "edit "

  -- Get the current line and cursor position
  local function get_cursor_info()
    local win = api.nvim_get_current_win()
    local buf = api.nvim_get_current_buf()
    local cursor = api.nvim_win_get_cursor(win)
    local line_num = cursor[1]
    local col = cursor[2]
    local line = api.nvim_buf_get_lines(buf, line_num - 1, line_num, false)[1]
    return line, col, win
  end

  -- Find Markdown link under the cursor
  local function find_markdown_link(line, col)
    local search_start_index = 1
    while true do
      local link_start, link_end, _, target = line:find("%[([^]]*)%]%(([^)]*)%)", search_start_index)
      if not link_start then
        break
      end
      if col >= (link_start - 1) and col < link_end then
        return target
      end
      search_start_index = link_end + 1
    end
    return nil
  end

  -- Get file or word under the cursor
  local function get_target_from_cursor(line, col)
    local target = fn.expand("<cfile>")
    if not target or target == "" then
      local cursor_col_1based = col + 1
      local find_start = 1
      while true do
        local word_start, word_end, word = line:find("([^%s]+)", find_start)
        if not word_start then
          break
        end
        if word_start <= cursor_col_1based and word_end >= cursor_col_1based then
          return word
        end
        find_start = word_end + 1
      end
    end
    return target
  end

  -- Open a URL
  local function open_url(url)
    if vim.startswith(url, "www.") and not (vim.startswith(url, "http://") or vim.startswith(url, "https://")) then
      url = "http://" .. url
    end
    vim.ui.open(url)
  end

  -- Navigate to a file
  local function navigate_to_file(path, line_number_cmd)
    local current_file_dir = fn.expand("%:p:h")
    if not (vim.startswith(path, "/") or vim.startswith(path, "~") or path:match("^[a-zA-Z]:")) then
      path = current_file_dir .. "/" .. path
    end
    local norm_ok, norm_path = pcall(vim.fs.normalize, path)
    if norm_ok then
      path = norm_path
    end
    if fn.filereadable(path) == 1 or fn.isdirectory(path) == 1 then
      pcall(vim.cmd, ecmd .. line_number_cmd .. fn.fnameescape(path))
      return true
    end
    return false
  end

  -- Search for an anchor in the current file
  local function search_anchor(anchor_text)
    local search_pattern = "^#\\+\\s*" .. fn.escape(anchor_text:gsub("-", "[%- ]"), "\\")
    if tab then
      vim.cmd("tabnew | buffer #")
    end
    if fn.search(search_pattern) > 0 then
      vim.cmd("normal! zz")
      return true
    end
    return false
  end

  -- Main logic
  local line, col, win = get_cursor_info()
  if not line then -- invalid line
    api.nvim_feedkeys(api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
    return
  end

  local target = find_markdown_link(line, col) or get_target_from_cursor(line, col)
  if not target or target == "" then
    api.nvim_feedkeys(api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
    return
  end

  -- Process the target
  if vim.startswith(target, "http://") or vim.startswith(target, "https://") or vim.startswith(target, "www.") then
    open_url(target)
    return
  end

  vim.cmd("normal! m'")

  local line_number_cmd = ""
  local anchor_text = ""
  local path_part = target

  -- Extract line number
  local line_num_match = path_part:match("(.+)#L(%d+)$")
  if line_num_match then
    path_part, line_number_cmd = line_num_match[1], "+" .. line_num_match[2] .. " "
  else
    local only_line_num = path_part:match("^#L(%d+)$")
    if only_line_num then
      path_part, line_number_cmd = "", "+" .. only_line_num .. " "
    end
  end

  -- Extract anchor
  local anchor_match = path_part:match("(.+)#(.+)$")
  if anchor_match then
    path_part, anchor_text = anchor_match[1], anchor_match[2]
  else
    local only_anchor = path_part:match("^#(.+)$")
    if only_anchor then
      path_part, anchor_text = "", only_anchor
    end
  end

  -- Navigate to file if applicable
  if path_part ~= "" then
    if navigate_to_file(path_part, line_number_cmd) then
      if anchor_text ~= "" then
        search_anchor(anchor_text)
      end
      return
    end
  end

  -- Search for anchor if no file navigation is needed
  if anchor_text ~= "" then
    if search_anchor(anchor_text) then
      return
    end
  end

  -- Jump to line number if applicable
  if line_number_cmd ~= "" then
    local line_num_val = tonumber(line_number_cmd:match("%d+"))
    if line_num_val then
      api.nvim_win_set_cursor(win, { line_num_val, 0 })
      vim.cmd("normal! zz")
      return
    end
  end

  -- Default action
  api.nvim_feedkeys(api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
end

return M
