return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
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
      ["<C-e>"] = { "hide", "show", "fallback" },
      -- used by neocodeium
      ["<C-n>"] = {},
      ["<C-p>"] = {},
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev", "fallback" },
    },
  },
}
