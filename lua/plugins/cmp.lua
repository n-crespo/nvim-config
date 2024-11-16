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

    opts.performance = {
      debounce = 0,
      throttle = 0,
    }
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
        border = "none",
        winhighlight = "Normal:CmpCompletion,FloatBorder:CmpDocumentationBorder,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = "single",
        winhighlight = "Normal:CmpDocumentation,FloatBorder:CmpCompletionBorder,CursorLine:PmenuSel,Search:None",
        wrap = false,
      },
    }
  end,

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
