return {
  "hrsh7th/nvim-cmp",
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
      ["<C-e>"] = {
        i = function()
          if require("cmp").visible() then
            require("cmp").close()
          else
            require("cmp").complete()
          end
        end,
      },
      ["<C-j>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Select }),
      ["<C-k>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Select }),
      ["<S-CR>"] = require("cmp").config.disable,
      ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
    }
    opts.experimental = {
      ghost_text = false,
    }
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
}
