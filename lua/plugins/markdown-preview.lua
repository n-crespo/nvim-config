return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install ()",
    -- config = function()
    --   vim.fn["mkdp#util#install"]()
    -- end,
  },
}
