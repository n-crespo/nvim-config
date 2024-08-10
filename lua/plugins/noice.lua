-- default LazyVim plugin
-- this config just adds borders to lsp hover (K)
return {
  "folke/noice.nvim",
  commit = "d9328ef903168b6f52385a751eb384ae7e906c6f",
  opts = {
    commands = {
      last = {
        opts = { border = "single" },
      },
    },
    presets = {
      lsp_doc_border = true,
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
          win_options = { wrap = false },
        },
      },
    },
  },
}
