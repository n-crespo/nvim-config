-- lsp configurations
return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      float = {
        border = "rounded",
      },
    },
    servers = {
      pyright = {},
      clangd = {},
      jdtls = { enabled = true }, -- java
      lua_ls = { enabled = false }, -- i don't need this and it makes things laggy
      -- marksman = { enabled = false }, -- i don't need this and it makes things laggy
      r_language_server = {},
      ruff_lsp = {}, -- for python
    },
    setup = {
      jdtls = function()
        return true -- avoid duplicate servers (??)
      end,
    },
  },
}
