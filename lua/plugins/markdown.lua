return {
  -- use <enter> to follow markdown links, <C-k> in insert mode to create
  -- links, <tab> to fold headers, <leader>mc for table of contents
  "ixru/nvim-markdown",
  config = function()
    -- markdown table of contents
    vim.keymap.set(
      "n",
      "<leader>mc",
      "<CMD>Toc<CR><CMD>set nornu<CR><cmd>set nonu<cr>",
      { silent = true, desc = "[C]ontents" }
    )
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_toc_autofit = 1
  end,
}
