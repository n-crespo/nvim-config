-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

opt.cursorlineopt = "number,screenline" -- cursorline respects wrapped lines
opt.relativenumber = false
opt.swapfile = false -- don't make backup swap files
opt.incsearch = true -- who knows
opt.scrolloff = 15 -- don't scroll all the way down
opt.sidescrolloff = 7 -- don't scroll all the way to the side
opt.sidescroll = 0 -- don't scroll all the way to the side
opt.numberwidth = 1 -- left side width
opt.textwidth = 80 -- formatted text width
opt.softtabstop = 2 -- 2 space tabs
opt.pumblend = 0 -- needed for cmp transparency
opt.startofline = true
opt.breakindent = true -- indent smartly
opt.smartcase = true -- casing in search
opt.ignorecase = true -- casing in search
opt.spelllang = "en" -- spell in english pls
opt.showtabline = 0
opt.cmdheight = 0 -- no cmdline on bottom of screen
opt.wrap = false
vim.g.loaded_ruby_provider = 0 -- never use these
vim.g.loaded_perl_provider = 0 -- never use these
vim.g.loaded_python3_provider = 0
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- opt.autochdir = true -- this breaks things

if LazyVim.is_win() then
  LazyVim.terminal.setup("pwsh")
end

-- --- for some reason this doesn't work unless I specify `== 1`???
-- if vim.fn.has("wsl") == 1 then
--   ---@diagnostic disable-next-line: undefined-field
--   opt.clipboard:append("unnamedplus") -- use system clipboard as default register
--   vim.g.clipboard = {
--     name = "xclip-wsl",
--     copy = {
--       ["+"] = { "xclip", "-quiet", "-i", "-selection", "clipboard" },
--       ["*"] = { "xclip", "-quiet", "-i", "-selection", "primary" },
--     },
--     paste = {
--       ["+"] = { "xclip", "-o", "-selection", "clipboard" },
--       ["*"] = { "xclip", "-o", "-selection", "primary" },
--     },
--     cache_enabled = 1, -- cache MUST be enabled, or else it hangs on dd/y/x and all other copy operations
--   }
-- elseif vim.fn.has("mac") == 1 or vim.fn.has("win32") == 1 then
--   opt.clipboard = "unnamedplus"
-- end
