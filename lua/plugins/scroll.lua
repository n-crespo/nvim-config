return {
  "Aasim-A/scrollEOF.nvim",
  enabled = true,
  event = { "CursorMoved", "WinScrolled" },
  opts = {
    disabled_filetypes = {
      "minifiles",
      "better_term",
      "lazyterm",
    },
  },
}
