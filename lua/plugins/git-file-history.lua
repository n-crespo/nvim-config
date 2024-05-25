return {
  "isak102/telescope-git-file-history.nvim",
  enabled = vim.fn.has("unix"), -- only load on unix
  event = "LazyFile",
  dependencies = { "tpope/vim-fugitive" },
  config = function()
    require("telescope").load_extension("git_file_history")
    vim.keymap.set("n", "<C-g>", "<cmd>Telescope git_file_history<cr>", { desc = "Git File History" })
  end,
}
