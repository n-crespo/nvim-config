vim.g.vim_markdown_toc_autofit = 1
return {
  -- use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
  -- to create links, <tab> to fold headers, <leader>mc for table of contents
  "ixru/nvim-markdown",
  ft = "markdown",
  keys = {
    { "<leader>t", "<cmd>Toc<cr><cmd>set nornu<cr><cmr>set nonu<cr>", desc = "Table of Contents" },
  },
}
