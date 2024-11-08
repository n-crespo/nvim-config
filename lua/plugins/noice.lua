-- default LazyVim plugin
-- this config just adds borders to lsp hover (K)
return {
  "folke/noice.nvim",
  -- this is needed cus borders break as of right now...
  commit = "0783e22",
  opts = {
    commands = {
      last = {
        opts = { border = "single" },
      },
    },
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
    lsp = {
      documentation = {
        opts = {
          border = { style = "single", padding = { 0, 1 } },
          win_options = { wrap = false },
          lang = "markdown",
        },
      },
    },
  },
}
