return {
  -- add gruvbox
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- { "rose-pine/neovim", name = "rose-pine" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    --
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
