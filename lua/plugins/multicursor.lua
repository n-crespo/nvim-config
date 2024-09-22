return {
  "mg979/vim-visual-multi",
  event = "LazyFile",
  config = function()
    vim.cmd([[silent! VMTheme codedark]])
    vim.cmd([[let g:VM_set_statusline = 0]])
    vim.cmd([[let g:VM_default_mappings = 0]]) -- disable everything but <C-n>
    vim.cmd([[
      let g:VM_maps = {}
      let g:VM_maps["Goto Prev"] = ''      " start selecting down
      let g:VM_maps["Goto Next"] = ''    " start selecting up
      let g:VM_maps["Undo"] = 'u'
      let g:VM_maps["Redo"] = '<C-r>'
    ]])
    -- remove useless keymaps
    -- vim.keymap.del("n", "\\\\\\")
    -- vim.keymap.del("n", "\\\\/")
    -- vim.keymap.del("n", "\\\\gS")
    -- vim.keymap.del("n", "\\\\A")
  end,
}
