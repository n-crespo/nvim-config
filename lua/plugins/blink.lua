return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        markdown = {
          name = "RenderMarkdown",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
        },
        buffer = {
          opts = {
            -- get words from all active buffers for cmp list
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ""
              end, vim.api.nvim_list_bufs())
            end,
          },
        },
        snippets = {
          min_keyword_length = 2,
        },
      },
    },
    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      menu = {
        auto_show = true,
        draw = {
          align_to = "cursor",
          padding = 0,
          treesitter = { "lsp" },
          columns = {
            { "label", "label_description", gap = 1 },
            { "space", "kind", gap = 0 },
          },
          components = {
            label = {
              text = function(ctx)
                return " " .. ctx.label
              end,
            },
            space = {
              width = { fill = true },
              text = function()
                return ""
              end,
            },
            kind = {
              text = function(ctx)
                return ctx.kind_icon .. ctx.kind .. " "
              end,
            },
          },
        },
      },
      documentation = {
        window = {
          border = "single",
          winhighlight = "FloatBorder:FloatBorder",
        },
      },
    },
    appearance = {
      kind_icons = { Text = "󰉿 " },
    },
    keymap = {
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<S-CR>"] = {},
      ["<C-e>"] = { "hide", "show", "fallback" },
      ["<C-n>"] = {}, -- used by neocodeium
      ["<C-p>"] = {}, -- used by neocodeium
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev" },
    },
  },
}
