return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      min_keyword_length = vim.bo.filetype == "markdown" and 1 or 0,
    },
    completion = {
      ghost_text = {
        enabled = false,
      },
      keyword = {
        exclude_from_prefix_regex = "",
      },
      menu = {
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
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:CmpCompletionBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },
    },
    keymap = {
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<S-CR>"] = {},
      ["<C-e>"] = { "hide", "show", "fallback" },
      -- used by neocodeium
      ["<C-n>"] = {},
      ["<C-p>"] = {},
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev" },
    },
  },
}
