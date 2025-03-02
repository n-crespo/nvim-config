-- this is a custom tabline component for lualinne.
-- (vim-style "tabs", see :h tabs)
local M = {}

---@param bufnr integer bufnr of some buffer
function M.should_populate(bufnr)
  local ignored_buftypes = { "prompt", "nofile", "terminal", "quickfix" }
  local ignored_filetypes = { "snacks_picker_preview" }

  local buftype = vim.bo[bufnr].buftype
  local filetype = vim.bo[bufnr].filetype

  return not vim.tbl_contains(ignored_buftypes, buftype) and not vim.tbl_contains(ignored_filetypes, filetype)
end

---@param bufnr integer bufnr of some buffer
function M.get_name(bufnr)
  return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
end

M.cached_tabline = {}

function M.tabline()
  -- Remove tabs that have been closed
  M.cached_tabline = { unpack(M.cached_tabline or {}, 1, vim.fn.tabpagenr("$")) }

  for i = 1, vim.fn.tabpagenr("$") do
    local focused = i == vim.fn.tabpagenr()
    local focus_hl = focused and "TablineSel" or "Tabline"

    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")

    if M.should_populate(bufnr) or M.cached_tabline[i] == nil then
      local icon, icon_hl = require("mini.icons").get("file", filename)

      if filename == "" then -- this is for empty new tabs
        icon = ""
        filename = ""
        icon_hl = focus_hl
      elseif filename:find(".scratch") then
        icon = ""
        filename = "scratch"
        icon_hl = "DiffChanged"
      end

      icon_hl = focused and icon_hl or focus_hl
      icon = icon ~= "" and icon .. " " -- if icon exists, add space

      M.cached_tabline[i] = {
        focus_hl = focus_hl,
        icon_hl = icon_hl,
        icon = icon,
        filename = filename,
      }
    else
      -- Update only the focus_hl
      M.cached_tabline[i].focus_hl = focus_hl
    end
  end

  -- Format and return the tabline
  local formatted_tabs = {}
  for _, tab in ipairs(M.cached_tabline) do
    table.insert(
      formatted_tabs,
      string.format(
        "%%#%s#%%#%s#%s%%#%s#%s%%#%s#",
        tab.focus_hl,
        tab.icon_hl,
        tab.icon,
        tab.focus_hl,
        tab.filename,
        tab.focus_hl
      )
    )
  end

  return table.concat(formatted_tabs, " ")
end

-- the following can be added after "require"ing this file so that the tabline
-- is only shown when there are more than 1 tab

-- cond = function()
--   return vim.fn.tabpagenr("$") > 1
-- end,

return M
