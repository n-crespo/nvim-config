-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- BUG: This is a limitation of using neovim in WSL, and makes yanking and
-- pasting a bit slow. Using "unnamedplus" makes it instant, but then increases
-- startup SUBSTANTIALLY (almost 900ms) (see :StartupTime --> clipboard.vim), so
-- this is my current best solution. Also I had to remove my powershell profile
-- configuration so it wouldn't take ten years to paste.

-- NOTE: I fixed this! See the line below this note, where I removed the
-- clipboard syncing entirely, and see the bottom of autocmds.lua to see the
-- autocmds that sync the clipboard for me. Amazing.

opt.clipboard = "" -- don't sync with system clipboard (see autocmds)
opt.mouse = "" -- disable mouse
opt.conceallevel = 3 -- Hide * markup for bold and italics
opt.autowrite = true -- Enable auto writes
opt.cursorline = false -- don't highlight current line (transparent background)
opt.rnu = true -- relative line numbers
opt.splitbelow = true -- self explanatory
opt.splitright = true -- self explanatory
opt.swapfile = false -- don't make backup swap files
opt.wrap = false -- don't wrap text by default
opt.incsearch = true -- who knows
opt.autochdir = false -- change directory to the location of current open buffer automatically (needed for persistence)
opt.scrolloff = 10 -- don't scroll all the way down
opt.sidescrolloff = 8 -- don't scroll all the way to the side
opt.sidescroll = 5 -- don't scroll all the way to the side
opt.numberwidth = 1 -- left side width
opt.textwidth = 80 -- formatted text width
opt.softtabstop = 2 -- 2 space tabs
opt.tabstop = 2 -- 2 space tabs
opt.shiftwidth = 2 -- 2 space tabs
opt.foldmethod = "manual" -- manual folding
opt.startofline = true -- motions by default put cursor on start of line
opt.pumblend = 0 -- needed for cmp transparency
opt.smartindent = true -- indent smartly
opt.breakindent = true -- indent smartly
opt.smartcase = true -- casing in search
opt.ignorecase = true -- casing in search
opt.spelloptions = "noplainbuffer"
vim.g.loaded_perl_provider = 0 -- what is even this (causes checkhealth error if true)
vim.g.wrap = false -- stop wrapping my text
vim.g.mapleader = " "
vim.g.maplocalleader = " "
