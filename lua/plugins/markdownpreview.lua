-- <leader>op (open preview) to open scroll-synchronized markdown preview window
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  dependencies = {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<Leader>o"] = { name = "+open" },
      },
    },
  },
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
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_auto_close = 0
    -- vim.g.mkdp_echo_preview_url = 1
    -- vim.g.mkdp_open_to_the_world = 1
    -- vim.g.mkdp_browser = "floorp"
  end,
}
