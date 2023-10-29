return {
  {
    -- load current theme
    "EdenEast/nightfox.nvim",
  },
  {

    "luisiacc/gruvbox-baby",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- set theme to load at start
      colorscheme = "carbonfox",
    },
  },

  -- don't load unused themes

  -- { "rose-pine/neovim", name = "rose-pine" },

  -- {
  --   "folke/tokyonight.nvim",
  --   -- make background transparent
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
}
