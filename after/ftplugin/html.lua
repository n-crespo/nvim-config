vim.keymap.set(
  "n",
  "<leader>ow",
  "<cmd>!open http://localhost:3000/<cr>",
  { desc = "Open Server", buffer = true, silent = true }
)

vim.keymap.set(
  "n",
  "<leader>os",
  "<cmd>!open https://localhost:3000<cr>",
  { desc = "Open Server", buffer = true, silent = true }
)
