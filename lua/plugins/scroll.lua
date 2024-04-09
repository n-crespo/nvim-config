return {
  "Aasim-A/scrollEOF.nvim",
  enabled = true,
  -- event = { "CursorMoved", "WinScrolled" },
  event = "LazyFile",
  opts = {
    disabled_filetypes = {
      "minifiles",
      "better_term",
      "lazyterm",
    },
  },
}
