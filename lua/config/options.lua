-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt

-- BUG: This is a limitation of using neovim in WSL, and makes yanking and
-- pasting a bit slow. Using "unnamedplus" makes it instant, but then increases
-- startup SUBSTANTIALLY (almost 900ms) (see :StartupTime --> clipboard.vim), so
-- this is my current best solution. Also I had to remove my powershell profile
-- configuration (🥲) so it wouldn't take ten years to paste.

-- NOTE: I fixed this! See the line below this note, where I removed the
-- clipboard syncing entirely, and see the bottom of autocmds.lua to see the
-- autocmds that sync the clipboard for me. Amazing.

opt.clipboard = "" -- don't sync with system clipboard (see autocmds)

-- vim.g.clipboard = {
--   name = "WslClipboard",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
--     ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
--   },
--   cache_enabled = 1,
-- }

-- disable mouse
opt.mouse = ""
-- Hide * markup for bold and italics
opt.conceallevel = 3
-- Enable auto writes
opt.autowrite = true
-- don't highlight current line (transparent background)
opt.cursorline = false
-- self explanatory
opt.relativenumber = true
-- self explanatory
opt.splitbelow = true
-- self explanatory
opt.splitright = true
-- don't make backup swap files
opt.swapfile = false
-- don't wrap text by default
opt.wrap = false
opt.incsearch = true -- who knows
-- change directory to the location of current open buffer automatically (needed for persistence)
opt.autochdir = false
-- don't scroll all the way down
opt.scrolloff = 8
-- don't scroll all the way to the side
opt.sidescrolloff = 8
-- don't scroll all the way to the side
opt.sidescroll = 5
-- left side width
opt.numberwidth = 1
-- formatted text width
opt.textwidth = 80
-- 2 space tabs
opt.softtabstop = 2
-- 2 space tabs
opt.tabstop = 2
-- 2 space tabs
opt.shiftwidth = 2
-- manual folding
opt.foldmethod = "manual"
-- motions by default put cursor on start of line
opt.startofline = true
-- what is even this (causes checkhealth error if true)
vim.g.loaded_perl_provider = 0
