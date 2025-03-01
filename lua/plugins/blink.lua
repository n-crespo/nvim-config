return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = function()
        local success, node = pcall(vim.treesitter.get_node)
        if success and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
          -- only show buffer source when inside of comment
          return { "buffer" }
        else
          return { "lsp", "path", "snippets", "buffer" }
        end
      end,
      providers = {
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
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
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
