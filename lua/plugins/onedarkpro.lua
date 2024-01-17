-- -- transparent background
-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
-- vim.api.nvim_set_hl(0, "FloatBorder", {bg = "none"})
-- vim.api.nvim_set_hl(0, "Pmenu", {bg = "none"})
local md_highlight = "#14161a"
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
      highlights = {
        ["@text.emphasis"] = { italic = true },
        ["@tag.html"] = { fg = "#89ca78" },

        ["@text.todo.unchecked"] = { bg = md_highlight },
        Headline = { bg = md_highlight },
        CodeBlock = { bg = md_highlight },

        WhichKeyFloat = { bg = nil }, -- transparent whichkey
        TabLineSel = { bg = "#22272f", bold = true },
        MiniStatuslineModeNormal = { bg = "#22272f" },
        LazyButton = { bg = "#22272f" },
        TreeSitterContext = { bg = "#22272f" },
      },
    })
    vim.cmd.colorscheme("onedark_dark")
  end,
}
