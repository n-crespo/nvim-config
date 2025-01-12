-- default LazyVim plugin
-- this config just adds borders to lsp hover (K)

return {
  "folke/noice.nvim",
  opts = {
    notify = { enabled = false },
    commands = {
      last = {
        opts = { border = "single" },
      },
    },
    views = {
      -- transparent lsp progress window
      mini = { win_options = { winblend = 0 } },
    },
    lsp = {
      documentation = {
        opts = {
          border = { style = "single", padding = { 0, 1 } },
          win_options = { wrap = true },
          position = {
            row = 2,
          },
        },
      },
    },
  },
}
