return {
  -- use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
  -- to create links, <tab> to fold headers, <leader>mc for table of contents
  "ixru/nvim-markdown",
  ft = "markdown",
  config = function()
    -- markdown table of contents (i never use this)
    vim.keymap.set(
      "n",
      "<leader>t",
      "<CMD>Toc<CR><CMD>set nornu<CR><cmd>set nonu<cr>",
      { silent = true, desc = "[t]oc" }
    )

    -- i'm not sure this does anything
    -- vim.g.vim_markdown_math = 1
    -- this does do something
    vim.g.vim_markdown_toc_autofit = 1
  end,
}
