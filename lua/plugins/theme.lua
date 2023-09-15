return {
  -- add gruvbox
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "EdenEast/nightfox.nvim", name = "nightfox", priority = 1000 },
  { "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = true,
    priority = 1000,
  },
  -- Configure LazyVim to load catpuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
}
