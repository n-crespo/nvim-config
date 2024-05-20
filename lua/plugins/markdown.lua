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
    -- vim.keymap.set(
    --   "n",
    --   "<leader>m",
    --   function()
    --     vim.g.vim_markdown_math = not vim.g.vim_markdown_math
    --     if vim.g.vim_markdown_math then
    --       vim.cmd([[setlocal syn=markdown]])
    --     else
    --       vim.cmd([[setlocal syn=]])
    --     end
    --   end,
    --   -- "<cmd>setlocal syn=markdown<cr>",
    --   { silent = false, desc = "Conceal Math" }
    -- )
  end,
}
