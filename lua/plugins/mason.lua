return {
  -- installing language servers
  "williamboman/mason.nvim",
  opts = {
    ui = {
      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
      border = "rounded",

      ---@since 1.0.0
      -- Width of the window. Accepts:
      -- - Integer greater than 1 for fixed width.
      -- - Float in the range of 0-1 for a percentage of screen width.
      width = 0.8,

      ---@since 1.0.0
      -- Height of the window. Accepts:
      -- - Integer greater than 1 for fixed height.
      -- - Float in the range of 0-1 for a percentage of screen height.
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
