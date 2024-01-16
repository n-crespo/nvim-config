return {
  -- highlight markdown headings and codeblocks (can get laggy)
  "lukas-reineke/headlines.nvim",
  event = { "BufEnter *.md", "BufEnter *.Rmd" },
  opts = {
    markdown = {
      -- fat_headline_upper_string = "▃",
      -- fat_headline_lower_string = "🬂",
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "▀",

      -- these make markdown a lot slower if enabled
      headline_highlights = false,
      codeblock_highlight = false,

      -- headline_highlights = { "Headline" },
      -- headline_highlights = false,
      -- dash_highlight = "Dash",
      -- dash_string = "",
      -- quote_highlight = "Quote",
      -- quote_string = "┃",
      -- fat_headlines = false,
    },
    rmd = {
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "▀",
      headline_highlights = false,
      codeblock_highlight = false,
    },
  },
}
