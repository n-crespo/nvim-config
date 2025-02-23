return {
  "nvim-treesitter/nvim-treesitter",
  event = "LazyFile",
  opts = {
    incremental_selection = { enable = false },
    ensure_installed = {
      "bash",
      "csv",
      "yaml",
      "xml",
      "vimdoc",
      "css",
    },
  },
}
