return {
  -- {
  --   -- load current theme
  --   "EdenEast/nightfox.nvim",
  -- },
  {
    "olimorris/onedarkpro.nvim",
    name = "onedarkpro",
    priority = 1000, -- Ensure it loads first
    colors = {
      dark = {
        bg = "#101010",
      },
      -- I am not sure if this is even doing anything
      virtual_text_warning = "#f59166",
      virtual_text_error = "#ff0000",
    },
    -- I am not sure if this is even doing anything
    highlights = {
      Error = {
        bg = "#FF0000",
        fg = "#FF0000",
      },
    },
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
