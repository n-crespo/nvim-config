return {
  -- add gruvbox
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine" },

  -- Configure LazyVim to load catpuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
