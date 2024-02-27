-- makes installing and managing language servers a lot easier
return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
      width = 0.8,
      height = 0.8,
    },
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
      "markdownlint",
      "mdformat",
      "pyright",
      "r-languageserver",
      "ruff-lsp",
      "shellcheck",
      "shfmt",
      "stylua",
      -- "lua-language-server",
      -- "marksman",
    },
  },
}
