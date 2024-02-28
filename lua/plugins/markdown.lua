-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <zh> to fold headers. Good. Kinda buggy and not maintained
-- but good
return {
  "n-crespo/nvim-markdown",
  ft = "markdown",
  keys = {
    { "<leader>t", "<cmd>Toc<cr><cmd>set nornu<cr><cmd>set nonu<cr>", desc = "Table of Contents" },
  },
  config = function()
    vim.cmd([[let g:vim_markdown_math = 1]])
    vim.g.vim_markdown_toc_autofit = 1
    vim.cmd([[map zh <Plug>Markdown_Fold]])
    vim.cmd([[map <Plug> <Plug>Markdown_CreateLink]])
    -- vim.cmd([[map <Plug> <Plug>Markdown_FollowLink]])
  end,
}
