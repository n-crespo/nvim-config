return {
  "mg979/vim-visual-multi",
  event = "LazyFile",
  config = function()
    vim.cmd([[silent! VMTheme codedark]])
    vim.keymap.del("n", "\\\\\\")
    vim.keymap.del("n", "\\\\/")
  end,
}
