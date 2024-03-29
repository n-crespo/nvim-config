-- theme of choice
-- transparent, italic comments, custom highlights
return {
  "olimorris/onedarkpro.nvim",
  enabled = true,
  lazy = false,
  name = "onedarkpro",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedarkpro").setup({
      styles = { -- For example, to apply bold and italic, use "bold,italic"
        comments = "italic", -- Style that is applied to comments
        virtual_text = "bold", -- Style that is applied to virtual text
      },
      options = {
        transparency = true, -- Use a transparent background?
        lualine_transparency = true,
      },
      plugins = {
        lualine = false,
      },
      highlights = {
        ["@markup.list.checked.markdown"] = { bg = nil }, -- otherwise its pink
        ["@markup.link.label.markdown_inline"] = { fg = "#61afef", underline = true },
        WhichKeyFloat = { bg = nil }, -- transparent whichkey
        FlashCurrent = { bg = "#e5c07b", fg = "#212121" },
        Visual = { bg = "#22272f" },
        Normal = { bg = "#121621" },
        Headline = { bg = "#22272f" },
        SignColumnNC = { bg = "#121621" },
        SignColumn = { bg = "#121621" },
        NoiceScrollbar = { bg = "#22272f" },
        CodeBlock = { bg = "#22272f" },
        MiniFilesHiglight = { bg = "#000000" },
        NoiceScrollbarThumb = { bg = "#434852" },
        TreesitterContextLineNumber = { fg = "#f2e9de" },
        MiniStarterItemBullet = { fg = "#61afef" },
        MiniStarterItemPrefix = { fg = "#89ca78" },
        NotifyBackground = { bg = "#22272f" }, -- needed bc of transparency
        InclineNormal = { bg = "#262f47" },
        InclineNormalNC = { bg = "#262f47" },
      },
    })
    vim.cmd.colorscheme("onedark_dark")
  end,
}
