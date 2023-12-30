return {
  -- {
  --   -- load current theme
  --   "EdenEast/nightfox.nvim",
  -- },
  {
    "olimorris/onedarkpro.nvim",
    name = "onedarkpro",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        styles = { -- For example, to apply bold and italic, use "bold,italic"
          comments = "italic", -- Style that is applied to comments
          virtual_text = "bold", -- Style that is applied to virtual text
        },
        options = {
          cursorline = false, -- Use cursorline highlighting?
          transparency = true, -- Use a transparent background?
          terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
          highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        },
      })
      vim.cmd.colorscheme("onedark_dark")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- set theme to load at start
      colorscheme = "onedark_dark",
    },
  },
}
