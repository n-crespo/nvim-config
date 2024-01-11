return {
  -- theme of choice, transparent, italic comments, markdown italic support
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
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
        highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
        bold = true,
        italic = true,
        underline = true,
        undercurl = true,
      },
      -- THIS IS NEEDED for italics in markdown to work properly
      highlights = {
        ["@text.emphasis"] = { italic = true },
        ["@text.todo.unchecked"] = { bg = "#161616" },
        WhichKeyFloat = { bg = nil }, -- transparent whichkey
        TabLineSel = { bg = "#2b303a" },
        MiniStatuslineModeNormal = { bg = "#2b303a" },
        LazyButton = { bg = "#2b303a" },
      },
      colors = {
        onedark_dark = {
          bg_statusline = "#080d18",
          -- bg_statusline = "",
        },
      },
    })
    vim.cmd.colorscheme("onedark_dark")
  end,
}
