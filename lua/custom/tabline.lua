-- this is a custom tabline component for lualinne.
-- (vim-style "tabs", see :h tabs)

-- i no longer use this. check lualine.lua for more robust tabline config

do
  return {}
end

-- make sure to refresh lualine when needed
vim.api.nvim_create_autocmd({ "TabNew", "TabEnter", "TabClosed", "WinEnter", "BufWinEnter" }, {
  callback = function()
    require("lualine").refresh() -- this assumes lualine has been loaded (this should be fine since the file is required by lualine)
  end,
})

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
    local focus_hl = focused and "TabLineSel" or "TabLine"

    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")

    if M.should_populate(bufnr) or M.cached_tabline[i] == nil then
      local icon, icon_hl, is_fallback = require("mini.icons").get("file", filename)

      local icon_fg
      if not is_fallback then
        local icon_color = vim.api.nvim_get_hl(0, { name = icon_hl, link = false })
        icon_fg = string.format("#%06x", icon_color.fg)
        -- print(icon_fg)
      end

      if filename == "" then -- this is for empty new tabs
        icon = ""
        filename = ""
        icon_hl = focus_hl
      elseif filename:find(".scratch") then
        icon = ""
        filename = "scratch"
        icon_hl = "DiffChanged"
      end

      -- return get_color("Normal", "bg#")
      local function get_color(group, attr)
        local fn = vim.fn
        return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
      end

      if focused then
        local focus_bg = get_color(focus_hl, "bg#")
        -- local icon_fg = get_color(icon_hl, "fg#")

        if focus_bg and icon_fg then
          vim.api.nvim_set_hl(0, "TabLineIconFocused", { fg = icon_fg, bg = focus_bg })
          icon_hl = "TabLineIconFocused"
        else
          print("falling back")
          icon_hl = focus_hl -- Fallback if something is missing
        end
      else
        icon_hl = focus_hl
      end

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
  for i, tab in ipairs(M.cached_tabline) do
    if not vim.g.lualine_hide_tabnr then
      tab.tabnr = (i > 1 and " " or "") .. i
    else
      tab.tabnr = ""
    end

    table.insert(
      formatted_tabs,
      string.format(
        "%%#%s# %s %%#%s# %%#%s#%s%%#%s# %s %%#%s#",
        tab.focus_hl, -- %#TabLine#
        tab.tabnr, -- 1(no ending space)
        tab.focus_hl, -- %#TabLine#
        tab.icon_hl, -- %#TabLine#
        tab.icon, -- icon
        tab.focus_hl, -- TabLine
        tab.filename, -- tabline.lua
        tab.focus_hl -- Tabline
      )
    )
  end

  return table.concat(formatted_tabs, " ")
end

-- (below) only show tabline when >1 tabs
-- cond = function()
--   return vim.fn.tabpagenr("$") > 1
-- end,

return M.tabline
