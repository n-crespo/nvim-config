return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = { enabled = false },
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
