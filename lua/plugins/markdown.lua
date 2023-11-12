return {
  { "ixru/nvim-markdown" },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "pandoc", "markdown", "md" },
    build = ":call mkdp#util#install ()",
    -- config = function()
    --   vim.fn["mkdp#util#install"]()
    -- end,
  },
}
