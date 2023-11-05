vim.diagnostic.config({
  float = { border = "rounded" },
})
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
  },
  opts = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    -- make sure mason installs the server
    servers = {
      jdtls = {},
      r_language_server = {},
      arduino_language_server = {},
      bashls = {},
    },
    setup = {
      jdtls = function()
        return true -- avoid duplicate servers
      end,
    },
  },
}
