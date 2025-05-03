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

--- Adjusts the width of a tab name in the tabline to ensure all tabs are evenly
--- distributed across the available screen width. (UNUSED)
---
--- @param context table A table containing the context for the tab, including the tab number (`context.tabnr`).
--- @param name string The original name of the tab, which may include status-line escape sequences.
--- @return string The adjusted tab name, padded to fit the calculated target width.
function M.apply_fullwidth_tabline(context, name)
  local n_tabs = vim.fn.tabpagenr("$")

  local margin = n_tabs
  local content_w = vim.o.columns - margin

  local base_w = math.floor(content_w / n_tabs)
  local leftover = content_w - base_w * n_tabs -- < n_tabs
  local tgt_w = (context.tabnr <= leftover) and (base_w + 1) or base_w

  -- visible width of the tabname (strip status‑line escapes)
  local plain = name
    :gsub("%%#.-#", "") -- %#hl#
    :gsub("%%[%d%@].-@", "") -- %@…@
    :gsub("%%[Tt*]", "") -- %T / %* reset

  local vis = vim.fn.strdisplaywidth(plain)
  local pad_needed = tgt_w - vis

  if pad_needed > 0 then
    local left = string.rep(" ", math.floor(pad_needed / 2))
    local right = string.rep(" ", pad_needed - #left)
    name = left .. name .. right
  end
  return name
end

return M
