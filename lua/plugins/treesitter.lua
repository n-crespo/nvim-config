return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "v<cr>", -- use S for this (flash)
        scope_incremental = "<CR>",
        node_incremental = "<TAB>",
        node_decremental = "<S-TAB>",
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
