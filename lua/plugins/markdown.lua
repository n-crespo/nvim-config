-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <zh> to fold headers. Good. Kinda buggy and not maintained
-- but good
return {
  "n-crespo/nvim-markdown",
  lazy = true,
  ft = "markdown",
  -- keys = {
  --   { "<leader>t", "<cmd>Toc<cr><cmd>set nornu<cr><cmd>set nonu<cr>", desc = "Table of Contents" },
  -- },
  config = function()
    vim.g.vim_markdown_math = 1
    vim.cmd([[map zh <Plug>Markdown_Fold]])
    vim.cmd([[map <Plug> <Plug>Markdown_CreateLink]])
  end,
  init = function()
    -- for markdown math viewing
    vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
      pattern = { "*.md" },
      callback = function()
        vim.cmd([[
          ownsyntax on
          set spelllang=en
          setlocal spell
          setlocal nowrap
        ]])
      end,
    })
  end,
}
