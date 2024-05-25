-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <zh> to fold headers.
return {
  "n-crespo/nvim-markdown",
  ft = "markdown",
  config = function()
    vim.g.vim_markdown_toc_autofit = 1
    vim.g.vim_markdown_math = false
    vim.cmd([[map zh <Plug>Markdown_Fold]])
    vim.cmd([[map <Plug> <Plug>Markdown_CreateLink]])
  end,
}
