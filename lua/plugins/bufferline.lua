return {
  -- tab line at top of screen, use <C-p> to [p]ick a buffer
  "akinsho/bufferline.nvim",
  opts = {
    highlights = {
      buffer_selected = {
        bold = true,
        italic = false,
      },
    },
  },
  keys = {
    { "<C-p>", "<cmd>BufferLinePick<cr>", desc = "[P]ick Buffer" },
  },
}
