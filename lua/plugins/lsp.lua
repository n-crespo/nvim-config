-- lsp configurations
return {
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    -- },
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
      -- make sure mason installs these server
      servers = {
        pyright = {},
        clangd = {},
        arduino_language_server = {},
        bashls = {},
        jdtls = {},
        jsonls = {},
        lua_ls = { enabled = false }, -- i don't need this and it makes things laggy
        marksman = { enabled = false }, -- i don't need this and it makes things laggy
        r_language_server = {},
        ruff_lsp = {},
      },
      setup = {
        jdtls = function()
          return true -- avoid duplicate servers (??)
        end,
      },
    },
  },
}
