return {
  -- highlight markdown headings and codeblocks (can get laggy)
  "lukas-reineke/headlines.nvim",
  event = { "BufEnter *.md", "BufEnter *.Rmd" },
  opts = {
    markdown = {
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "▀",
    },
    rmd = {
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "▀",
    },
  },
}
