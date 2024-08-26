return {
  "Aasim-A/scrollEOF.nvim",
  enabled = true,
  event = { "CursorMoved", "WinScrolled" },
  opts = {
    disabled_filetypes = {
      "minifiles",
      "minifiles-help",
      "better_term",
      "lazyterm",
    },
  },
}
