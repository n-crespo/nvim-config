-- disables some plugins
return {
  {
    "nvim-neo-tree/neo-tree.nvim", -- mini files better
    enabled = false,
  },
  {
    "nvimdev/dashboard-nvim", -- i use mini starter
    enabled = false,
  },
  {
    "nvim-pack/nvim-spectre", -- too risky, no undo
    enabled = false,
  },
  {
    "catppuccin", -- i don't use this
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim", -- i use tabby
    enabled = false,
  },
  {
    "folke/neoconf.nvim", -- this is useless to me afaik
    enabled = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
}
