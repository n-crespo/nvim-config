vim.keymap.set("i", "<S-Tab>", "<C-d>", { buffer = true, silent = true })
vim.keymap.set("i", "<C-]>", "<C-t>", { buffer = true, silent = true })
vim.keymap.set("i", "<C-e>", "```<cr><cr>```<up><up>", { buffer = true, silent = true })
vim.cmd([[ setlocal commentstring=<!--\ %s\ --> ]])
vim.keymap.set("i", "$", "$$<left>", { remap = false, silent = true, buffer = true })
vim.keymap.set("i", "\\$", "\\$", { remap = false, silent = true, buffer = true })
-- vim.keymap.set("i", "<C-b>", "****<left><left>", { remap = false, silent = true, buffer = true, desc = "Bold" })

vim.keymap.set(
  "n",
  "<leader>cs",
  "<cmd>Toc<cr><cmd>set nonu nornu<cr>",
  { buffer = true, silent = true, desc = "Table of Contents (Symbols)" }
)

vim.cmd([[inoreabbrev <buffer> ps <!-- prettier-ignore-start -->]])
vim.cmd([[inoreabbrev <buffer> pe <!-- prettier-ignore-end -->]])

-- NOTE these save to the `r` register arbitrarily as to not clog up system clipboard
vim.keymap.set("x", "<C-b>", '"rc****<esc>h"rP', { buffer = true })
vim.keymap.set("x", "<C-i>", '"rc**<esc>"rP', { buffer = true })

vim.cmd([[
augroup MarkdownCfSyntax
    autocmd!
    autocmd FileType markdown syntax include @markdownCf syntax/cf.vim
    autocmd FileType markdown syntax region markdownCodeBlockCf start="```cf" end="```" contains=@markdownCf
augroup END
]])
