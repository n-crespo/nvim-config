return {
  {
    "ixru/nvim-markdown",
    config = function()
      -- markdown table of contents
      vim.keymap.set("n", "<leader>mtc", "<CMD>Toc<CR><CMD>set nornu<CR>", { silent = true, desc = "TOC" })
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_toc_autofit = 1
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    config = function()
      -- support for markdown table mode
      vim.keymap.set("n", "<leader>mtm", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Table [M]ode" })
    end,
  },
}
