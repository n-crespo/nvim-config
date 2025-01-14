local M = {}

M.tabline = function()
  -- NOTE this could have potentially been done with the "tabs" lualine
  -- component rather than doing it manually buuuuut the builtin one is weird
  local tabs = {}
  local current_tab = vim.fn.tabpagenr()
  for i = 1, vim.fn.tabpagenr("$") do
    local winnr = vim.fn.tabpagewinnr(i)
    local winid = vim.fn.win_getid(winnr, i)
    local bufnr = vim.fn.winbufnr(winid)
    local bufname = vim.fn.bufname(bufnr)
    local name = vim.fn.fnamemodify(bufname, ":t")

    local icon, color =
      require("nvim-web-devicons").get_icon(name, vim.fn.fnamemodify(bufname, ":e"), { default = true })

    if name == "" then
      name = ""
      icon = ""
    elseif name == "fish" then
      icon = ""
      name = "terminal"
    elseif name == "lazygit" then
      icon = "󰊢"
    end

    local highlight_group = "LualineTabInactive"
    if i == current_tab then
      highlight_group = "LualineTabActive"
    end

    -- this is quite disgusting innit
    local tab_display = string.format(
      "%%#%s#[%%#%s#%s %%#%s#%s%%#%s#]",
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

-- cond = function()
--   return vim.fn.tabpagenr("$") > 1 --- show only when more than 1 tab
-- end,

return M
