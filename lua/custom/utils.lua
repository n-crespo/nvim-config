-- NOTE; this is for the reload plugin keymaps
local M = {}

function M.pluginNames()
  local function readFile(filepath)
    local file = io.open(filepath, "r")
    if not file then
      print("Failed to open file:", filepath)
      return nil
    end
    local content = file:read("*a") -- Read the entire file content
    file:close()
    return content
  end

  local lazyLock = "~/.config/nvim/lazy-lock.json"
  local content = readFile(vim.fn.expand(lazyLock)) -- Expand the '~'
  if not content then
    print("Failed to read file.")
    return
  end

  -- Lua json decoder needs some pacakge from luarocks
  -- Decode JSON content to a Lua table using Neovim's json_decode
  local data = vim.fn.json_decode(content)
  if not data then
    print("Failed to decode JSON.")
    return
  end

  local keys = {}
  for key, _ in pairs(data) do
    table.insert(keys, key)
  end

  return keys
end

-- This function tries to find the current buffer's directory. If it can't find
-- that, it returns the previously visited buffer's directory. If it can't find
-- that either, it return the current working directory.
function M.get_dir_with_fallback()
  local bufdir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
  -- if current buffer is a terminal, use fallback dir
  bufdir = vim.api.nvim_get_option_value("buftype", { scope = "local" }) == "terminal" and "" or bufdir
  return bufdir ~= "" and bufdir
    or vim.fn.bufexists(vim.fn.bufnr("#")) and vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr("#")), ":h")
    or vim.uv.cwd()
end

return M
