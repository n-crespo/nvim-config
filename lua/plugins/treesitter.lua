return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = false,
    },
    ensure_installed = {
      "csv",
      "bash",
      "yaml",
      "xml",
      "vimdoc",
      "latex",
    },
  },
}
