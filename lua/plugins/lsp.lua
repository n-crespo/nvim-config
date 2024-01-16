return {
  -- lsp configurations
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
      -- make sure mason installs the server
      servers = {
        pyright = {},
        clangd = {},
        arduino_language_server = {},
        bashls = {},
        jdtls = {},
        jsonls = {},
        -- lua_ls = {},
        lua_ls = { enabled = false },
        r_language_server = {},
        ruff_lsp = {},
      },
      setup = {
        jdtls = function()
          return true -- avoid duplicate servers
        end,
      },
    },
  },
}
