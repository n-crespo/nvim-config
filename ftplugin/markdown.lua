vim.keymap.set(
  "n",
  "<C-s>",
  "<cmd>TableModeRealign<cr><cmd>w<cr>",
  { desc = "Save and Format File", buffer = true, silent = true }
)
vim.keymap.set("i", "<S-Tab>", "<C-d>", { buffer = true, silent = true })
vim.keymap.set("i", "*", "**<left>", { buffer = true, silent = true })
vim.keymap.set("i", "$", "$$<left>", { buffer = true, silent = true })
vim.keymap.set("i", "_", "__<left>", { buffer = true, silent = true })
vim.keymap.set("i", "<C-e>", "```<cr><cr>```<up><up>", { buffer = true, silent = true })
vim.cmd([[ setlocal commentstring=<!--\ %s\ --> ]])
vim.keymap.set("n", "<leader>m", function()
  vim.cmd([[
  ownsyntax on
  set spelllang=en
  set spell
]])
end, { desc = "Preview Math", silent = true, buffer = true })
