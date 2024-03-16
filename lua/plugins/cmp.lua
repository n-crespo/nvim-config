-- this configuration just adds borders to the transparent completion windows
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
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
      ["<C-j>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Insert }),
      -- ["<C-l>"] = require("cmp").mapping.confirm({ select = true }), -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = nil,
    }),
  },
}
