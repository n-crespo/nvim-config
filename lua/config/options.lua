-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

if vim.fn.has("wsl") then
  opt.clipboard:append("unnamedplus") -- use system clipboard as default register
  vim.g.clipboard = {
    name = "xclip-wsl",
    copy = {
      ["+"] = { "xclip", "-quiet", "-i", "-selection", "clipboard" },
      ["*"] = { "xclip", "-quiet", "-i", "-selection", "primary" },
    },
    paste = {
      ["+"] = { "xclip", "-o", "-selection", "clipboard" },
      ["*"] = { "xclip", "-o", "-selection", "primary" },
    },
    cache_enabled = 1, -- cache MUST be enabled, or else it hangs on dd/y/x and all other copy operations
  }
elseif vim.fn.has("mac") or vim.fn.has("win32") then
  opt.clipboard = "unnamedplus"
end

opt.mouse = "a" -- disable mouse
opt.conceallevel = 2 -- Hide * markup for bold and italics
opt.autowrite = true -- Enable auto writes
opt.cursorline = true -- don't highlight current line (transparent background)
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
opt.spelllang = "en" -- spell in english pls
opt.scroll = 15
opt.showtabline = 1
vim.g.loaded_ruby_provider = 0 -- never use these
vim.g.loaded_perl_provider = 0 -- never use these
vim.g.wrap = false -- stop wrapping my text
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazygit_config = true -- use custom layzgit config for icons/stuff
vim.g.dark_bg = false -- custom option for custom 'macro' theme
vim.g.python3_host_prog = "/usr/bin/python3"

if vim.fn.has("win32") and not vim.fn.has("wsl") then
  vim.notify("windows detected")
  vim.cmd([[
    let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
    let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
    let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
    let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
    set shellquote= shellxquote=
  ]])
end

vim.cmd([[
set complete=
set completeopt=
]])

vim.cmd([[
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

set tabline=%!MyTabLine()
]])
