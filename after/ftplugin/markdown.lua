vim.keymap.set("i", "<S-Tab>", "<C-d>", { buffer = true, silent = true })
vim.keymap.set("i", "<C-b>", "****<left><left>", { buffer = true, silent = true })
-- vim.cmd([[ setlocal commentstring=<!--\ %s\ --> ]])

vim.cmd([[inoreabbrev <buffer> ps <!-- prettier-ignore-start -->]])
vim.cmd([[inoreabbrev <buffer> pe <!-- prettier-ignore-end -->]])

-- NOTE; these save to the `r` register arbitrarily as to not clog up system clipboard
-- bold/italicize in visual mode
vim.keymap.set("x", "<C-b>", '"rc****<esc>h"rP', { buffer = true, desc = "Bold" })
vim.keymap.set("x", "<C-i>", '"rc__<esc>"rP', { buffer = true, desc = "Italicize" })
