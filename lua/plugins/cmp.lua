-- this configuration just adds borders to the transparent completion windows
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  opts = {
    formatting = {
      format = function(_, item)
        local icons = require("lazyvim.config").icons.kinds
        if icons[item.kind] then
          item.kind = icons[item.kind] .. item.kind
        end
        item.menu = ""
        return item
      end,
    },
    view = {
      entries = {
        follow_cursor = true,
      },
    },
    window = {
      completion = {
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
        scrollbar = true,
      },
      documentation = {
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpCompletionBorder,CursorLine:PmenuSel,Search:None",
        scrollbar = true,
        wrap = false,
      },
    },
    -- mapping = require("cmp").mapping.preset.insert({
    --   ["<C-j>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Insert }),
    --   ["<C-k>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Insert }),
    -- }),
  },
}
