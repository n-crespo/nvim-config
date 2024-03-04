vim.cmd([[set ft=rmd]])
vim.keymap.set("i", "<C-e>", "```{r}<cr><cr>```<up>", { buffer = true, silent = true, desc = "R Code Block" })
vim.keymap.set("n", "<C-e>", "i```{r}<cr><cr>```<up>", { buffer = true, silent = true, desc = "R Code Block" })
