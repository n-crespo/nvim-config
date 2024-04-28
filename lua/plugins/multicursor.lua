return {
  "mg979/vim-visual-multi",
  event = "LazyFile",
  config = function()
    vim.cmd([[silent! VMTheme codedark]])
    -- remove useless keymaps
    vim.keymap.del("n", "\\\\\\")
    vim.keymap.del("n", "\\\\/")
    vim.keymap.del("n", "\\\\gS")
    vim.keymap.del("n", "\\\\A")
  end,
}
