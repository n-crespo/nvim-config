-- this configuration just adds borders to the transparent completion windows
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  opts = {
    window = {
      completion = {
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        scrollbar = false,
      },
      documentation = {
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        scrollbar = false,
      },
    },
    mapping = require("cmp").mapping.preset.insert({
      ["<C-l>"] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-j>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Insert }),
    }),
  },
}
