-- default LazyVim plugin
-- this config just adds borders to lsp hover (K)

return {
  "folke/noice.nvim",
  opts = {
    notify = { enabled = false },
    views = {
      -- transparent lsp progress window
      mini = { win_options = { winblend = 0 } },
    },
    lsp = {
      hover = {
        enabled = true,
        silent = true,
      },
      documentation = {
        opts = {
          border = { style = "rounded", padding = { 0, 1 } },
          win_options = { wrap = true },
          position = {
            row = 2,
          },
        },
      },
    },
  },
  keys = { { "<leader>snt", false } },
}
