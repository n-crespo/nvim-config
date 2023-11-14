return {
  {
    -- load current theme
    "EdenEast/nightfox.nvim",
  },
  {
    "olimorris/onedarkpro.nvim",
    name = "onedarkpro",
    priority = 1000, -- Ensure it loads first
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- set theme to load at start
      colorscheme = "onedark_dark",
    },
  },

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
