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

return M
