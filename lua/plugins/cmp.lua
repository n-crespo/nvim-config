return {
  "hrsh7th/nvim-cmp",
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
    opts.snippet = {
      expand = function(item)
        return LazyVim.cmp.expand(item.body)
      end,
    }
    if LazyVim.has("nvim-snippets") then
      table.insert(opts.sources, { name = "snippets" })
    end
  end,
  keys = {
    {
      "<Tab>",
      function()
        return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<S-Tab>",
      function()
        return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
      end,
      expr = true,
      silent = true,
      mode = { "i", "s" },
    },
  },
  config = function()
    local cmp = require("cmp")
    local formatting = {
      format = function(_, item)
        local icons = require("lazyvim.config").icons.kinds
        if icons[item.kind] then
          item.kind = icons[item.kind] .. item.kind
        end
        item.menu = ""
        return item
      end,
    }

    local sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
    }, {
      { name = "buffer" },
    })

    local next = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end

    local mapping = {
      ["<C-n>"] = require("cmp").config.disable,
      ["<C-p>"] = require("cmp").config.disable,
      ["<C-j>"] = next,
      ["<C-k>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Insert }),
      ["<S-CR>"] = require("cmp").config.disable,
      ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
      -- ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
    }

    local window = {
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
    }

    cmp.setup({
      formatting = formatting,
      mapping = mapping,
      sources = sources,
      window = window,
      experimental = {
        ghost_text = false,
      },
      view = {
        ---@diagnostic disable-next-line: missing-fields
        entries = {
          follow_cursor = false,
        },
      },
    })
  end,
}
