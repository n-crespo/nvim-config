-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt

-- BUG: This is a limitation of using neovim in WSL, and makes yanking and
-- pasting a bit slow. Using "unnamedplus" makes it instant, but then increases
-- startup SUBSTANTIALLY (almost 900ms) (see :StartupTime --> clipboard.vim), so
-- this is my current best solution. Also I had to remove my powershell profile
-- configuration (🥲) so it wouldn't take ten years to paste.

-- HACK: I found that if I run neovim as root this is a huge problem, but when
-- I'm not running as root its totally fine. Using the below as clipboard also
-- made pasting take like a full second which was frustrating. Just using a
-- non-root user works like a charm.

-- NOTE: I fixed this! See line 33, where I removed the clipboard syncing
-- entirely, and see the bottom of autocmds.lua to see the autocmds that sync
-- the clipboard for me. Amazing. Clocking 80ms startup time.

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

opt.clipboard = "" -- don't sync with system clipboard (see autocmds)
-- opt.mouse = "" -- disable mouse
opt.conceallevel = 3 -- Hide * markup for bold and italics
opt.autowrite = true -- Enable auto writes
opt.cursorline = false -- don't highlight current line (transparent background)
opt.relativenumber = true -- self explanatory
-- vim.g.netrw_browsex_viewer = "" -- edit commands for gx and :open
opt.splitbelow = true -- self explanatory
opt.splitright = true -- self explanatory
opt.swapfile = false -- don't make backup swap files
opt.wrap = false -- don't wrap text by default
opt.incsearch = true -- who knows
opt.autochdir = true -- change directory to the location of current open buffer automatically
opt.scrolloff = 8 -- don't scroll all the way down
opt.sidescrolloff = 8 -- don't scroll all the way to the side
opt.sidescroll = 5 -- don't scroll all the way to the side
opt.numberwidth = 1 -- left side width
opt.relativenumber = true -- rnu
opt.textwidth = 80 -- formatted text width
opt.softtabstop = 2 -- 2 space tabs
opt.tabstop = 2 -- 2 space tabs
opt.shiftwidth = 2 -- 2 space tabs
opt.foldmethod = "indent" -- indent folding
