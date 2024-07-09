vim.keymap.set("i", "<S-Tab>", "<C-d>", { buffer = true, silent = true })
vim.keymap.set("i", "<C-e>", "```<cr><cr>```<up><up>", { buffer = true, silent = true })
vim.cmd([[ setlocal commentstring=<!--\ %s\ --> ]])
vim.keymap.set("i", "$", "$$<left>", { remap = false, silent = true, buffer = true })
vim.keymap.set("i", "\\$", "\\$", { remap = false, silent = true, buffer = true })
-- vim.keymap.set("i", "<C-b>", "****<left><left>", { remap = false, silent = true, buffer = true, desc = "Bold" })

vim.keymap.set("n", "<leader>cs", "<cmd>Toc<cr><cmd>set nonu nornu<cr>", { buffer = true, silent = true })

vim.cmd([[inoreabbrev <buffer> ps <!-- prettier-ignore-start -->]])
vim.cmd([[inoreabbrev <buffer> pe <!-- prettier-ignore-end -->]])

vim.keymap.set("x", "<C-b>", "c****<esc>hP", { buffer = true })
vim.keymap.set("x", "<C-i>", "c**<esc>P", { buffer = true })
vim.keymap.set("n", "<C-b>", "gsaiw*", { remap = true, buffer = true })
vim.keymap.set("n", "<C-i>", "gsaiw_", { remap = true, buffer = true })
