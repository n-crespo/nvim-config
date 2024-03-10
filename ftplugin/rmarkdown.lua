vim.cmd([[set ft=rmd]])
vim.keymap.set("i", "<C-e>", "```{r}<cr><cr>```<up>", { buffer = true, silent = true, desc = "R Code Block" })
vim.keymap.set("n", "<C-e>", "i```{r}<cr><cr>```<up>", { buffer = true, silent = true, desc = "R Code Block" })

vim.keymap.set(
  "n",
  "<leader>rh",
  'i---<CR>title: ""<CR>author: "Nicolas Crespo"<CR>date: "`r Sys.Date()`"<CR>output: pdf_document<CR>---<CR><CR>```{r setup, include=FALSE}<CR>knitr::opts_chunk$set(echo = TRUE)<CR>```<CR><CR>---<CR><CR>',
  { desc = "Rmarkdown Header" }
)
