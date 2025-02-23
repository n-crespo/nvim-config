-- this is a custom tabline component for lualinne.
-- (vim-style "tabs", see :h tabs)
local M = {}

M.tabline = function()
  -- this could have potentially been done with the "tabs" lualine
  -- component rather than doing it manually buuuuut the builtin one is weird
  local tabs = {}
  for i = 1, vim.fn.tabpagenr("$") do
    local focused = i == vim.fn.tabpagenr()
    local highlight_group = focused and "TablineSel" or "Tabline"

    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
    local icon, color = require("mini.icons").get("file", name)

    if buftype == "nofile" then
      icon = ""
      name = ""
      color = highlight_group
    elseif name == "" then
      icon = "󰓩"
      name = ""
      color = ""
      color = highlight_group
    elseif buftype == "terminal" then
      icon = ""
      name = "terminal"
    elseif name:find(".scratch") then
      icon = ""
      name = "scratch"
    end

    icon = icon ~= "" and icon .. " " or icon

    -- there's gotta be a better way to do this but it works now sooo
    local tab_display = string.format(
      "%%#%s#%%#%s#%s%%#%s#%s%%#%s#",
      highlight_group,
      color,
      icon,
      highlight_group,
      name,
      highlight_group
    )
    table.insert(tabs, tab_display)
  end
  return table.concat(tabs, " ")
end

-- the following can be added after "require"ing this file so that the tabline
-- is only shown when there are more than 1 tab

-- cond = function()
--   return vim.fn.tabpagenr("$") > 1
-- end,

return M
