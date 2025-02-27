vim.keymap.set(
  "n",
  "<S-CR>",
  "<cr>:silent! cclose | lclose<cr>",
  { buffer = true, silent = true, desc = "Select and Close TOC" }
)
