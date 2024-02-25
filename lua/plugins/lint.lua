return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          -- disable errors for: inline html, line length, alt text, dashes
          -- instead of asterisks
          args = { "--disable", "MD013", "MD004", "MD033", "MD045", "--" },
        },
      },
    },
  },
}
