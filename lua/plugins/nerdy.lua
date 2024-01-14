return -- Lazy
{
  "2kabhishek/nerdy.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>fg", "<cmd>Nerdy<cr>", { silent = true, desc = "Find Glyphs" })
  end,
}
