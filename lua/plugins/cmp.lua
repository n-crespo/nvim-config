return {
  "iguanacucumber/magazine.nvim",
  name = "nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
      },
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },
  opts = function(_, opts)
    -- opts.completion = {
    --   completeopt = "menu,menuone,noinsert",
    -- }
    -- local format_kinds = opts.formatting.format
    -- opts.formatting = function(entry, item)
    --   format_kinds(entry, item) -- add icons
    --   -- return require("magazine").formatter(entry, item)
    -- end
    opts.mapping = {
      ["<C-e>"] = { i = require("cmp").mapping.abort() },
      ["<C-j>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Select }),
      ["<C-k>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Select }),
      ["<S-CR>"] = require("cmp").config.disable,
      ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
    }
    opts.experimental = vim.list_extend(opts.experimental or {}, {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    })
    opts.view = {
      entries = {
        follow_cursor = true,
      },
    }
    opts.window = {
      completion = {
        border = "single",
        -- scrollbar = false,
        winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
      },
    }
    opts.window = {
      documentation = {
        border = "single",
        -- scrollbar = false,
        winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpCompletionBorder,CursorLine:PmenuSel,Search:None",
      },
    }
  end,

  -- local formatting = {
  --   format = function(_, item)
  --     local icons = LazyVim.config.icons.kinds
  --     if icons[item.kind] then
  --       item.kind = icons[item.kind] .. item.kind
  --     end
  --
  --     local widths = {
  --       abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
  --       menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
  --     }
  --
  --     for key, width in pairs(widths) do
  --       if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
  --         item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
  --       end
  --     end
  --
  --     return item
  --   end,
  -- }

  -- local window = {
  --   completion = {
  --     -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  --     -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
  --     winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
  --     scrollbar = true,
  --   },
  --   documentation = {
  --     -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  --     border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
  --     winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpCompletionBorder,CursorLine:PmenuSel,Search:None",
  --     scrollbar = true,
  --     wrap = false,
  --   },
  -- }
}
