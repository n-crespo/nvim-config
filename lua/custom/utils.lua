local M = {}

-- This function tries to returns one of the following. If trying to find one
-- fails, it fallback to the next in the list.
--   a) the directory of the current buffer
--   b) the previously visited buffer's directory (using the :h alternate-file)
--   b) the current working directory.
---@param filename? string filename to optionally append to resulting path
function M.get_dir_with_fallback(filename)
  filename = filename or ""

  -- Get alternate buffer directory if it exists
  local alt_buf = vim.api.nvim_buf_is_valid(vim.fn.bufnr("#"))
      and vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr("#")), ":p")
    or nil

  -- If the buffer is not a file, fallback to alternate buffer or cwd
  if vim.api.nvim_get_option_value("buftype", { scope = "local" }) ~= "" or not vim.api.nvim_buf_is_valid(0) then
    return alt_buf or vim.uv.cwd()
  end

  -- Get directory of the current buffer or fallback
  local bufdir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
  local dir = bufdir ~= "" and bufdir or alt_buf or vim.uv.cwd()

  -- file opened may be unsaved, if so ignore filename
  filename = vim.uv.fs_stat(bufdir .. "/" .. filename) and filename or ""

  -- Validate the constructed path, fallback if invalid
  if not vim.uv.fs_stat(dir .. "/" .. filename) then
    dir = alt_buf or alt_buf or vim.uv.cwd()
  end

  -- append filename so cursor opens on current file
  return dir .. "/" .. filename
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

-- used in opt.foldtext in options.lua
function M.fold_virt_text(result, s, lnum, coloff)
  if not coloff then
    coloff = 0
  end
  local text = ""
  local hl
  for i = 1, #s do
    local char = s:sub(i, i)
    local hls = vim.treesitter.get_captures_at_pos(0, lnum, coloff + i - 1)
    local _hl = hls[#hls]
    if _hl then
      local new_hl = "@" .. _hl.capture
      if new_hl ~= hl then
        table.insert(result, { text, hl })
        text = ""
        hl = nil
      end
      text = text .. char
      hl = new_hl
    else
      text = text .. char
    end
  end
  table.insert(result, { text, hl })
end

-- used in opt.foldtext in options.lua
function M.custom_foldtext()
  local start = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
  local end_str = vim.fn.getline(vim.v.foldend)
  local end_ = vim.trim(end_str)
  local result = {}

  -- Add the start and end lines with Tree-sitter highlighting
  M.fold_virt_text(result, start, vim.v.foldstart - 1)
  table.insert(result, { " ... ", "Delimiter" })
  M.fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match("^(%s+)") or ""))

  -- Add the number of folded lines at the end
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  table.insert(result, { string.format(" (%d lines)", line_count), "Comment" })

  return result
end

return M
