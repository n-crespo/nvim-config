-- lsp configurations
-- require("lspconfig.ui.windows").default_options.border = "single"
return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      float = {
        border = "single",
      },
    },
    ui = {
      default_options = {
        border = "single",
      },
    },
    document_highlight = {
      enabled = false,
    },
    setup = {
      jdtls = function()
        return true -- avoid duplicate servers (??)
      end,
    },
  },
}
