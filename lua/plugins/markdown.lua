-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <zh> to fold headers.
return {
  "n-crespo/nvim-markdown",
  ft = "markdown",
  config = function()
    vim.g.vim_markdown_toc_autofit = 1
    vim.g.vim_markdown_math = 0
    vim.cmd([[map zh <Plug>Markdown_Fold]])
    vim.cmd([[map <Plug> <Plug>Markdown_CreateLink]])
    vim.keymap.set(
      "n",
      "<leader>m",
      function()
        if vim.g.vim_markdown_math == 0 then
          vim.cmd([[setlocal syn=markdown]])
          vim.g.vim_markdown_math = 1
        elseif vim.g.vim_markdown_math == 1 then
          vim.cmd([[setlocal syn=]])
          vim.g.vim_markdown_math = 0
        end
      end,
      -- "<cmd>setlocal syn=markdown<cr>",
      { silent = false, desc = "Conceal Math", buffer = true }
    )
  end,
  -- init = function()
  --   -- for markdown math viewing
  --   vim.api.nvim_create_autocmd({ "FileType", "BufReadPost" }, {
  --     pattern = { "*.md" },
  --     callback = function()
  --       vim.cmd([[
  --       setlocal syn=markdown
  --       ]]) -- this will enable concealing inline math + some latex symbols
  --     end,
  --   })
  -- end,
}
