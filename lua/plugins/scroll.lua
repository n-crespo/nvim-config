return {
  "Aasim-A/scrollEOF.nvim",
  enabled = true,
  -- event = { "CursorMoved", "WinScrolled" },
  event = "LazyFile",
  opts = {
    disabled_filetypes = {
      "minifiles",
      "minifiles-help",
      "better_term",
      "lazyterm",
      "snacks_terminal",
    },
  },
}
