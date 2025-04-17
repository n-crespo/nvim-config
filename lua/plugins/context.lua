return {
  "nvim-treesitter/nvim-treesitter-context",
  optional = true,
  opts = {
    -- multiwindow = true, -- Enable multiwindow support.
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "snacks_terminal" }, -- list of language that will be disabled
    },
  },
}
