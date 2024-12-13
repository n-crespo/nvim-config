return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "v<cr>", -- use S for this (flash)
        scope_incremental = "<S-CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
      },
    },
    ensure_installed = {
      "csv",
      "bash",
      "yaml",
      "xml",
      "vimdoc",
    },
  },
}
