require("config.lazy")
vim.cmd.colorscheme("macro")
vim.hl = vim.highlight

vim.cmd([[
if !has('nvim')
  set viminfo+=n~/vim/viminfo
else
  " Do nothing here to use the neovim default
  " or do soemething like:
  set viminfo+=n~/.shada
endif
]])
