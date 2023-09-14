return {
  -- add gruvbox
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Configure LazyVim to load catpuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
