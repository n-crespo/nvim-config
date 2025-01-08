return {
  "benlubas/wrapping-paper.nvim",
  event = "LazyFile",
  keys = {
    {
      "<leader>wp",
      function()
        require("wrapping-paper").wrap_line()
      end,
      desc = "Fake wrap current line",
    },
  },
}
