return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = { enable = false },
    ensure_installed = {
      "bash",
      "csv",
      "yaml",
      "xml",
      "vimdoc",
    },
  },
}
