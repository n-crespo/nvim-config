return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      default = function()
        if vim.bo.filetype == "minifiles" then
          return { "buffer", "path" }
        end

        local pos = vim.api.nvim_win_get_cursor(0) -- Get current cursor position (row, col - 1-based)
        local row, col = pos[1] - 1, pos[2] -- Convert to 0-based row, col
        local capture = vim.treesitter.get_node({ bufnr = 0, pos = { row, col } })
        local captures = vim.treesitter.get_captures_at_cursor(0)

        -- if we are the end of a line, the captures table will be empty {} and
        -- the capture variable will be `block` probably. This gets around
        -- comment detection. So we can try to look at the location left of the
        -- cursor and actually see if we are in a comment or not.
        if (not captures or not next(captures)) and col > 0 then
          -- try the locatino to the left, if it exists (col ~= 0)
          capture = vim.treesitter.get_node({ bufnr = 0, pos = { row, col - 1 } })
        end

        if captures and capture then
          local node_type = capture:type()
          if
            vim.tbl_contains(
              { "comment", "line_comment", "block_comment", "comment_content", "string", "string_content" },
              node_type
            )
          then
            return { "buffer" }
          end
        end

        return { "lsp", "path", "snippets", "buffer" }
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
          -- align_to = "cursor",
          treesitter = { "lsp" },
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
          components = {
            label = {
              width = { fill = true, max = 45 },
            },
            kind = {
              text = function(ctx)
                -- if ctx.kind == "Snippet" then
                --   return "Snip"
                -- end
                return ctx.kind
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
