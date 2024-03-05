return {
  "benlubas/wrapping-paper.nvim",
  event = "LazyFile",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  -- vim.keymap.set(
  --   "n",
  --   "gww", -- see :h gw to figure out why this makes sense.
  --   require("wrapping-paper").wrap_line,
  --   { desc = "fake wrap current line" }
  -- )
  keys = {
    "<leader>p"
    require("wrapping-paper").wrap_line,
    desc = "fake wrap current line"
    silent = true
  }
}
