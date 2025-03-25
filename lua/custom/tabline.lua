-- this is a custom tabline component for lualinne.
-- (vim-style "tabs", see :h tabs)

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

      local function resolve_highlight(name)
        local hl = vim.api.nvim_get_hl(0, { name = name })
        if hl and hl.link then
          return vim.api.nvim_get_hl(0, { name = hl.link }) -- Resolve linked highlight
        end
        return hl
      end

      if focused then
        local focus_hl_def = resolve_highlight(focus_hl)
        local icon_hl_def = resolve_highlight(icon_hl)

        local focus_bg = focus_hl_def and focus_hl_def.bg or nil
        local icon_fg = icon_hl_def and icon_hl_def.fg or nil

        if focus_bg and icon_fg then
          vim.api.nvim_set_hl(0, "TablineIconFocused", { fg = icon_fg, bg = focus_bg })
          icon_hl = "TablineIconFocused"
        else
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
        "%%#%s#%s%%#%s# %%#%s#%s%%#%s#%s%%#%s#",
        tab.focus_hl,
        tab.tabnr,
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

-- (below) only show tabline when >1 tabs
-- cond = function()
--   return vim.fn.tabpagenr("$") > 1
-- end,

return M.tabline
