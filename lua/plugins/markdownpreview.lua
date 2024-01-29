-- <leader>op (open preview) to open scroll-synchronized markdown preview window
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>op",
      "<cmd>MarkdownPreviewToggle<cr>",
      ft = "markdown",
      desc = "Markdown preview",
    },
  },
  config = function()
    vim.cmd([[do FileType]])
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_auto_close = 0
  end,
}
