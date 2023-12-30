vim.diagnostic.config({
  float = { border = "rounded" },
})
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "arduino-language-server",
        "bash-language-server",
        "black",
        "cbfmt",
        "clang-format",
        "clangd",
        "flake8",
        "jdtls",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        -- "marksman",
        "mdformat",
        "pyright",
        "r-languageserver",
        "ruff-lsp",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
    opts = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      -- make sure mason installs the server
      servers = {
        pyright = {},
        clangd = {},
        arduino_language_server = {},
        bashls = {},
        jdtls = {},
        jsonls = {},
        lua_ls = {},
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
