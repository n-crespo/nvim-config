return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        scope_incremental = "<TAB>",
        node_incremental = "<CR>",
        node_decremental = "<S-CR>",
      },
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
