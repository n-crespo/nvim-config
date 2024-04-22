return {
  "mg979/vim-visual-multi",
  event = "LazyFile",
  config = function()
    vim.cmd([[silent! VMTheme codedark]])
  end,
}
