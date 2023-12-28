-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- centers c-d and c-u
local Util = require("lazyvim.util")
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Go Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Go Up" })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { noremap = true, desc = "Next jumplist" })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { noremap = true, desc = "Previous jumplist" })

-- centers search function
vim.keymap.set("n", "n", "nzzzv", { noremap = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, desc = "Previous Search Result" })

-- allow changing and deleting without overriding current paste registers
-- in other words automatically delete or change to the void register
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true, silent = true, desc = "Delete till end of line" })
vim.api.nvim_set_keymap("v", "D", '"_D', { noremap = true, silent = true, desc = "Delete till end of line" })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete" })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete" })

vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true, desc = "Change till end of line" })
vim.api.nvim_set_keymap("v", "C", '"_C', { noremap = true, silent = true, desc = "Change till end of line" })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true, desc = "Change" })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true, desc = "Change" })

vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete under cursor" })
vim.api.nvim_set_keymap("v", "x", '"_x', { noremap = true, silent = true, desc = "Delete under cursor" })

vim.api.nvim_create_user_command("FloatingTerm", function()
  Util.terminal.open()
end, {})

-- run python
vim.keymap.set(
  "n",
  "<leader>rp",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> python3 <C-\><C-n>"#pi<CR> ]],
  { silent = true, desc = "Run [P]ython File" }
)

-- run java
vim.keymap.set(
  "n",
  "<leader>rj",
  [[:set autochdir<CR>:w<CR>:FloatingTerm<CR>javac <C-\><C-n>"#pi && java <C-\><C-n>"#pi<BS><BS><BS><BS><BS><CR> ]],
  { silent = true, desc = "Run [J]ava File" }
)

-- run cpp
vim.keymap.set(
  "n",
  "<leader>rc",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> g++ -o <C-\><C-n>"#pi<BS><BS><BS><BS> <C-\><C-n>"#pi && ./<C-\><C-n>"#pi<BS><BS><BS><BS><CR> ]],
  { desc = "Run [C]++ File", silent = true }
)

-- This conflicts with vim's <C-a> key map that increments selected numbers, but
-- I think it is a worth trade-off because <C-a> to select the whole file is so common
-- in every other application I use. (C-x decrements numbers)
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select [A]ll" })

-- adds <Control + backspace> and <Control + delete> to insert mode
vim.keymap.set("i", "", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-Del>", "<C-o>de")
vim.keymap.set("i", "<A-a>", "<C-o>A", { silent = true })

-- replace all instances of word (without LSP)
vim.keymap.set(
  "n",
  "<leader>ci",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace [I]nstances" }
)

-- remove all other windows, same as :on or :only
vim.keymap.set("n", "<leader>wo", [[:only <CR>]], { silent = true, desc = "Window [O]nly" })

-- window rotate
vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window [R]otate" })

-- don't let cursor fly around when using J
vim.keymap.set("n", "J", "mzJ`z<cmd>delm z<CR>", { silent = true, desc = "better J" })

-- better z<CR> (top line)
vim.keymap.set("n", "z<CR>", "zt", { desc = "Top this line" })

-- center view port on double escape
vim.keymap.set("n", "<ESC><ESC>", "<cmd>noh<cr><esc>zz", { noremap = false, silent = true, desc = "Center" })

-- open in windows system viewer (for WSL)
vim.keymap.set("n", "<leader>ow", "<cmd>!wsl-open %<cr>", { silent = true, desc = "Open in Windows System Viewer" })

-- open in system viewer
vim.keymap.set("n", "<leader>os", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })

-- nb sync
vim.keymap.set("n", "<leader>gn", "<CMD>!nb sync<CR>", { desc = "Sync with [n]b" })

-- delete and save to register
vim.keymap.set("v", "<leader>d", "ygvd", { desc = "Delete to Register", silent = true })
vim.keymap.set("n", "<leader>d", "yydd", { desc = "Delete to Register", silent = true })

-- open terminal buffer in split
vim.keymap.set("n", "<leader>T", "<cmd>vsp | term<cr><cmd>set nornu | set nonu<cr>a", { desc = "Terminal Split" })

-- increment and decrements
vim.keymap.set("n", "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<C-x>", { noremap = true, silent = true })

-- center definition/references

vim.keymap.set("n", "gd", "gdzz", { desc = "Go to Definition", noremap = true, silent = true })
vim.keymap.set("n", "gr", "grzz", { desc = "Go to References", noremap = true, silent = true })

-- Force save as sudo (for readonly files)
vim.keymap.set("n", "<leader>W", "<cmd>w !sudo tee %<cr>", { desc = "Force Save", noremap = true, silent = true })

-- indent with tab and shift tab
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Increase Indent", silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Decrease Indent", silent = true })

-- these don't work because they are used as glaze keymappings
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- replacements to alt + j and alt + k
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })
