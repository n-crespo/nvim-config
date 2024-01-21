local md_highlight = "#14161a"
return {
  -- theme of choice, transparent, italic comments, markdown italic support
  "olimorris/onedarkpro.nvim",
  name = "onedarkpro",
  priority = 1000, -- Ensure it loads first
  opts = {
    styles = { -- For example, to apply bold and italic, use "bold,italic"
      comments = "italic", -- Style that is applied to comments
      virtual_text = "bold", -- Style that is applied to virtual text
    },
    options = {
      lualine_transparency = true, -- unneeded due to custom lualine theme
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
      -- ["@text.emphasis"] = { italic = true },
      --@markup.quote.markdown
      ["@markup.italic.markdown_inline"] = { italic = true },
      ["@markup.quote.markdown"] = { fg = "#808791" },
      -- ["@tag.html"] = { fg = "#89ca78" },
      ["@markup.list.checked.markdown"] = { bg = md_highlight },
      -- ["@text.todo.unchecked"] = { bg = md_highlight },
      Headline = { bg = md_highlight },
      CodeBlock = { bg = md_highlight },

      WhichKeyFloat = { bg = nil }, -- transparent whichkey
      TabLineSel = { bg = "#22272f", bold = true },
      MiniStatuslineModeNormal = { bg = "#22272f" },
      LazyButton = { bg = "#22272f" },
      TreeSitterContext = { bg = "#22272f" },
    },
  },
  config = function(_, opts)
    require("onedarkpro").setup(opts)
    vim.cmd.colorscheme("onedark_dark")
  end,
}
