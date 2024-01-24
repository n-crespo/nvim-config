return -- Lazy
{
  "2kabhishek/nerdy.nvim",
  event = "LazyFile",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>fg", "<cmd>Nerdy<cr>", desc = "Find Glyphs" },
  },
}
