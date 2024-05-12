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
    servers = {
      clangd = {},
      jdtls = { enabled = true }, -- java
      lua_ls = { enabled = false }, -- i don't need this and it makes things laggy
      marksman = { enabled = false }, -- i don't need this and it makes things laggy
      r_language_server = {},
      ruff_lsp = { enabled = false }, -- for python
      asm_lsp = {},
      eslint = {},
      tsserver = {},
      cssls = {},
    },
    setup = {
      jdtls = function()
        return true -- avoid duplicate servers (??)
      end,
    },
  },
}
