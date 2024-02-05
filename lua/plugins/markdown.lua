-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <tab> to fold headers. Good. Kinda buggy and not maintained
-- but good
vim.g.vim_markdown_toc_autofit = 1
return {
  "ixru/nvim-markdown",
  ft = "markdown",
  keys = {
    { "<leader>t", "<cmd>Toc<cr><cmd>set nornu<cr><cmd>set nonu<cr>", desc = "Table of Contents" },
  },
}
