-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <tab> to fold headers. Good. Kinda bugggy and not maintained
-- but good
vim.g.vim_markdown_toc_autofit = 1
return {
  "ixru/nvim-markdown",
  ft = "markdown",
}
