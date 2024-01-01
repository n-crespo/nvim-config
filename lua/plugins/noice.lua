return {
  -- default LazyVim plugin
  -- this config just adds borders to lsp hover (K)
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = true,
    },
  },
}
