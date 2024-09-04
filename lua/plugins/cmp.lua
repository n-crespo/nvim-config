return {
  "yioneko/nvim-cmp",
  branch = "perf",
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
  config = function()
    local cmp = require("cmp")

    local formatting = {
      format = function(_, item)
        local icons = LazyVim.config.icons.kinds
        if icons[item.kind] then
          item.kind = icons[item.kind] .. item.kind
        end

        local widths = {
          abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
          menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
        }

        for key, width in pairs(widths) do
          if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
            item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
          end
        end

        return item
      end,
    }
    local sources = cmp.config.sources({
      { name = "snippets" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
    })

    local mapping = {
      ["<C-e>"] = { i = require("cmp").mapping.abort() },
      ["<C-j>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Select }),
      ["<C-k>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Select }),
      ["<S-CR>"] = require("cmp").config.disable,
      ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
      -- ["<C-n>"] = require("cmp").config.disable,
      -- ["<C-p>"] = require("cmp").config.disable,
      -- ["<c-u>"] = cmp.mapping.scroll_docs(-4),
      -- ["<c-d>"] = cmp.mapping.scroll_docs(4),
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

    local snippet = {
      expand = function(item)
        return LazyVim.cmp.expand(item.body)
      end,
    }

    cmp.setup({
      ---@diagnostic disable-next-line: missing-fields
      performance = {
        debounce = 0, -- default is 60ms
        throttle = 0, -- default is 30ms
      },
      formatting = formatting,
      mapping = mapping,
      sources = sources,
      window = window,
      snippet = LazyVim.has("nvim-snippets") and snippet or nil,
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
}
