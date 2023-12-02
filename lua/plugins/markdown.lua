return {
  { "ixru/nvim-markdown" },
  { "dhruvasagar/vim-table-mode" },
  -- markdown preview is loaded through lazy extras (but it's having problems...)
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function()
  --     vim.fn["mkdp#util#install"]()
  --   end,
  -- },
}
