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
    { "<A-a>", "<cmd>BufferLineGoToBuffer 1<cr>" },
    { "<A-s>", "<cmd>BufferLineGoToBuffer 2<cr>" },
    { "<A-d>", "<cmd>BufferLineGoToBuffer 3<cr>" },
  },
}
