vim.cmd([[ownsyntax on]])
vim.cmd([[set cole=2]])
vim.cmd([[set spelllang=en]])
vim.cmd([[set nowrap!]])
vim.cmd([[set spell]])

vim.keymap.set(
  "n",
  "<C-s>",
  "<cmd>TableModeRealign<cr><cmd>w<cr>",
  { desc = "Save and Format File", buffer = true, silent = true }
)
vim.keymap.set("i", "<S-Tab>", "<C-d>", { buffer = true, silent = true })
vim.keymap.set("i", "*", "**<left>", { buffer = true, silent = true })
