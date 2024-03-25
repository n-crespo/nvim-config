-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

opt.clipboard = "" -- don't sync with system clipboard (see autocmds.lua for WSL clipboard support)
opt.mouse = "" -- disable mouse
opt.conceallevel = 2 -- Hide * markup for bold and italics
opt.autowrite = true -- Enable auto writes
opt.cursorline = false -- don't highlight current line (transparent background)
opt.rnu = true -- relative line numbers
opt.splitbelow = true -- self explanatory
opt.splitright = true -- self explanatory
opt.swapfile = false -- don't make backup swap files
opt.wrap = false -- don't wrap text by default
opt.incsearch = true -- who knows
opt.scrolloff = 15 -- don't scroll all the way down
opt.sidescrolloff = 0 -- don't scroll all the way to the side
opt.sidescroll = 0 -- don't scroll all the way to the side
opt.numberwidth = 1 -- left side width
opt.textwidth = 80 -- formatted text width
opt.softtabstop = 2 -- 2 space tabs
opt.tabstop = 2 -- 2 space tabs
opt.shiftwidth = 2 -- 2 space tabs
opt.foldmethod = "manual" -- manual folding
opt.pumblend = 0 -- needed for cmp transparency
opt.smartindent = true -- indent smartly
opt.startofline = true
opt.breakindent = true -- indent smartly
opt.smartcase = true -- casing in search
opt.ignorecase = true -- casing in search
opt.spelllang = "en"
opt.showtabline = 2 -- always show tabline
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.wrap = false -- stop wrapping my text
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.vim_markdown_toc_autofit = 1
vim.g.lazyvim_python_lsp = "basedpyright"
