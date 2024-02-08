-- adds highlighted markdown headings and codeblocks (can make laggy
-- scrolling) (i disabled that)
-- also makes block quotes and horizontal lines look better (not so laggy)
return {
  "lukas-reineke/headlines.nvim",
  ft = { "markdown", "rmd" },
  opts = {
    markdown = {
      -- no glyph support, use this
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "▀",

      -- these make markdown a lot slower if enabled
      -- headline_highlights = true,
      codeblock_highlight = false,
    },
    rmd = {
      -- no glyph support, use this
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "▀",

      -- these make markdown a lot slower if enabled
      -- headline_highlights = false,
      codeblock_highlight = false,
    },
  },
}
