-- makes installing and managing language servers a lot easier
return {
  "williamboman/mason.nvim",
  event = "LspAttach",
  opts = {
    ui = {
      border = "single",
      width = 0.8,
      height = 0.8,
    },
    ensure_installed = {
      "arduino-language-server",
      -- "bash-language-server",
      "black", -- python
      "clang-format",
      "clangd",
      "flake8",
      "jdtls",
      "json-lsp",
      -- "r-languageserver",
      "shellcheck",
      "shfmt",
      "stylua",
      "lua-language-server",
      "prettier",
      -- "typescript-language-server",
      -- "eslint-lsp",
      -- "css-lsp",
    },
  },
}
