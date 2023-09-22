-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- alt + arrow key in vscode
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- centers c-d and c-u
local Util = require("lazyvim.util")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- centers search function
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- check primeagen video for separating y and leader y from yank for
-- only vim and yank for system clipboard
vim.api.nvim_get_color_map()

-- allow changing and deleting without overriding current paste registers
-- in otherwords automatically delete or change to the void register
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "D", '"_D', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "C", '"_C', { noremap = true, silent = true })

-- format python file (with black)
-- conflicts with telescope projects (project.nvim)
-- vim.keymap.set("n", "<leader>fp", [[:w <CR> :!black % <CR><CR>]])

-- run java file
-- TODO: do something or other
-- vim.keymap.set("n", "<leader>jj", [[:cd %:h<cr> :w<CR>:!javac %<cr> :!java %:r<cr>]])

vim.api.nvim_create_user_command("FloatingTerm", function()
  Util.float_term()
end, {})

vim.keymap.set("n", "<C-s>", [[:set autochdir<CR>:w<CR>]], { silent = true })
vim.keymap.set(
  "n",
  "<leader>pp",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> python3 <C-\><C-n>"#pi<CR> ]],
  { silent = true }
)
vim.keymap.set(
  "n",
  "<leader>jj",
  [[:set autochdir<CR>:w<CR>:FloatingTerm<CR>javac <C-\><C-n>"#pi && java <C-\><C-n>"#pi<BS><BS><BS><BS><BS><CR> ]],
  { silent = true }
)

vim.keymap.set(
  "n",
  "<leader>cp",
  [[:set autochdir<CR>:w <CR>:FloatingTerm <CR> g++ -o <C-\><C-n>"#pi<BS><BS><BS><BS> <C-\><C-n>"#pi && ./<C-\><C-n>"#pi<BS><BS><BS><BS><CR> ]],
  { silent = true }
)

-- change directory things
vim.keymap.set("n", "<leader>fd", [[:set autochdir <CR>]])
vim.keymap.set("n", "<leader>cu", [[:cd ..<cr>]])
-- this is for (leader + s) changes all instances of the word the cursor is
-- ontop of to the next word typed
-- replace word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- c++ things
-- vim.keymap.set("n", "<leader>cp", [[:w <CR>:!g++ % -o %:r && %:r<CR>]])
-- open terminal buffer
vim.keymap.set("n", "<leader>tm", [[:term <cr>]])
-- select full file
vim.keymap.set("n", "<C-a>", [[gg<S-v>G]])
-- r markdown code block
vim.keymap.set("n", "<leader>rb", [[i ```{r}<cr>```<esc>O]])
-- attempt to do colorscheme preview keymap
vim.keymap.set("n", "<leader>th", [[:Telescope colorscheme<cr>]], { silent = true })
-- undo tree (muntree)
vim.keymap.set("n", "<leader>ut", [[:UndotreeToggle <cr>]], { silent = true })
vim.keymap.set("n", "<leader>up", [[:Telescope undo <cr>]], { silent = true })
-- lsp install
vim.keymap.set("n", "<leader>il", [[:LspInstall <CR>]], { silent = true })
-- paste without overriding paste
vim.keymap.set("n", "<leader>op", [["_dP]])
-- remove all other windows
vim.keymap.set("n", "<leader>on", [[:only <CR>]], { silent = true })
-- view alpha (homescreen) buffer
vim.keymap.set("n", "<leader>a", [[:Alpha<CR>]], { silent = true })

-- repeat last command in vertical split terminal buffer
-- vim.keymap.set("n", "<leader>tt", [[:vsplit <CR> :term <CR> i clear <CR> <Up><Up> <CR>]])
-- vim.keymap.set("n", "<leader>tn", [[:put=expand('%:p')<CR> "9yy dd:vsplit <CR> :term cd <ESC>"4p <CR>]])

-- close buffer and window
vim.keymap.set("n", "<leader>xc", [[:bdelete <CR>]], { silent = true })

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>e",
  ":set autochdir<CR>:Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>",
  { noremap = true, silent = true }
)
