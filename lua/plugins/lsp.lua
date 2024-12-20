-- lsp configurations
require("lspconfig.ui.windows").default_options.border = "single"
return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      float = {
        border = "single",
      },
    },
    document_highlight = {
      enabled = false,
    },
    servers = {
      clangd = {},
      jdtls = { enabled = true }, -- java
      lua_ls = { enabled = true }, -- i don't need this and it makes things laggy
      -- r_language_server = {},
      -- eslint = {},
      ruff_lsp = { enabled = false },
      tsserver = {},
      -- cssls = {},
      gopls = {},
    },
    setup = {
      jdtls = function()
        return true -- avoid duplicate servers (??)
      end,
    },
  },
}
