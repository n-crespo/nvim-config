-- this is a custom tabline component for lualinne.
-- (vim-style "tabs", see :h tabs)
local M = {}

M.tabline = function()
  -- this could have potentially been done with the "tabs" lualine
  -- component rather than doing it manually buuuuut the builtin one is weird
  local tabs = {}
  for i = 1, vim.fn.tabpagenr("$") do
    local focused = i == vim.fn.tabpagenr()
    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")

    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
    local icon, color = require("mini.icons").get("filetype", filetype)

    if name == "" then
      name = "[]"
      icon = ""
    elseif name == "fish" or filetype == "snacks_terminal" then
      icon = ""
      name = "terminal"
    elseif name == "lazygit" then
      icon = "󰊢"
      color = "GitSignsDelete"
    end

    local highlight_group = focused and "TablineActive" or "TablineInactive"
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
