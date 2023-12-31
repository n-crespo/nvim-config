return {
  -- installing language servers
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
}
