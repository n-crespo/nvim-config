-- theme of choice
-- transparent, italic comments, custom highlights
return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  name = "onedarkpro",
  priority = 1000, -- Ensure it loads first
  opts = {
    styles = { -- For example, to apply bold and italic, use "bold,italic"
      comments = "italic", -- Style that is applied to comments
      virtual_text = "bold", -- Style that is applied to virtual text
    },
    options = {
      transparency = true, -- Use a transparent background?
      bold = true,
      italic = true,
      underline = true,
      undercurl = true,
    },
    highlights = {
      ["@markup.list.checked.markdown"] = { bg = nil }, -- otherwise its pink
      ["@markup.link.label.markdown_inline"] = { fg = "#61afef", underline = true },
      WhichKeyFloat = { bg = nil }, -- transparent whichkey
      FlashCurrent = { bg = "#e5c07b", fg = "#212121" },
      TabLineSel = { bg = "#22272f" }, -- cokeline
      Visual = { bg = "#21272f" },
      Headline = { bg = "#22272f" },
      NoiceScrollbar = { bg = "#22272f" },
      NoiceScrollbarThumb = { bg = "#434852" },
      TreeSitterContext = { bg = "#22272f" },
      MiniStarterItemBullet = { fg = "#61afef" },
      MiniStarterItemPrefix = { fg = "#89ca78" },
      TabLine = { bg = "#22272f" },
    },
  },
  config = function(_, opts)
    require("onedarkpro").setup(opts)
    require("lualine").setup({
      options = {
        theme = require("transparentlualine").theme,
      },
    })
    vim.cmd.colorscheme("onedark_dark")
  end,
}
