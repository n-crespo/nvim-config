return {
  {
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
  },
  {
    "dhruvasagar/vim-table-mode",
    config = function()
      -- support for markdown table mode
      vim.keymap.set("n", "<leader>mt", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Table Mode [T]oggle" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>op",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_auto_close = 0
    end,
  },
}
