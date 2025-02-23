-- this is a custom tabline component for lualinne.
-- (vim-style "tabs", see :h tabs)
local M = {}

M.tabline = function()
  -- this could have potentially been done with the "tabs" lualine
  -- component rather than doing it manually buuuuut the builtin one is weird
  local tabs = {}
  for i = 1, vim.fn.tabpagenr("$") do
    local icon, color
    local focused = i == vim.fn.tabpagenr()
    local focus_hl = focused and "TablineSel" or "Tabline"

    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })

    -- this accounts for any floating popup windows, pickers, etc (non-editable files)
    if buftype == "prompt" or buftype == "nofile" then
      -- get first real file in tab, use that name (not float)
      local win_ids = vim.api.nvim_tabpage_list_wins(i)
      for _, win_id in ipairs(win_ids) do
        bufnr = vim.api.nvim_win_get_buf(win_id)
        buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })

        if buftype == "" then
          name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
        end
      end
    end

    icon, color = require("mini.icons").get("file", name)

    if name == "" then -- this is for empty new tabs
      icon = ""
      name = ""
      color = focus_hl
    elseif buftype == "terminal" then
      icon = ""
      name = "terminal"
    elseif name:find(".scratch") then
      icon = ""
      name = "scratch"
    end

    icon = icon ~= "" and icon .. " " -- if icon actually exists, put a space at the end

    -- there's gotta be a better way to do this but it works now sooo
    local tab_display = string.format("%%#%s#%%#%s#%s%%#%s#%s%%#%s#", focus_hl, color, icon, focus_hl, name, focus_hl)
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
