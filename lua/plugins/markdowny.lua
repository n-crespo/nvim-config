return {
  "n-crespo/markdowny.nvim",
  lazy = true,
  ft = "markdown",
  -- config = function()
  -- require("markdowny").setup({ filetypes = { "markdown", "txt" } })
  -- end,
  keys = {
    { mode = "v", "<C-k>", "<cmd>lua require('markdowny').link()<cr>", desc = "Markdowny link" },
    { mode = "v", "<C-b>", "<cmd>lua require('markdowny').bold()<cr>", desc = "Markdowny bold" },
    { mode = "v", "<C-i>", "<cmd>lua require('markdowny').italic()<cr>", desc = "Markdowny italic" },
    { mode = "v", "<C-e>", "<cmd>lua require('markdowny').code()<cr>", desc = "Markdowny code" },
  },
}
