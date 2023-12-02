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

vim.api.nvim_get_color_map()

-- allow changing and deleting without overriding current paste registers
-- in other words automatically delete or change to the void register
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true, silent = true, desc = "Delete till end of line" })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete" })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete" })

vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true, desc = "Change till end of line" })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true, desc = "Change" })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true, desc = "Change" })

vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true, desc = "Delete under cursor" })

vim.api.nvim_create_user_command("FloatingTerm", function()
  Util.terminal.open()
end, {})

-- run python
vim.keymap.set(
  "n",
  "<leader>rp",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> python4 <C-\><C-n>"#pi<CR> ]],
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

-- telescope find plugin files
vim.keymap.set("n", "<leader>fp", function()
  require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
end, { silent = true, desc = "Find [P]lugin File" })

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

-- R markdown code block
vim.keymap.set("n", "<leader>Rb", [[i```{r}<cr>```<esc>O]], { desc = "R Code Block", silent = true })
-- R knit html
vim.keymap.set("n", "<leader>Rkh", [[:w <cr>:RMarkdown html<CR>]], { silent = true, desc = "R Knit html" })
-- R knit pdf
vim.keymap.set(
  "n",
  "<leader>Rkp",
  [[:w <cr>:RMarkdown pdf latex_engine="xelatex"<CR>]],
  { silent = true, desc = "R Knit pdf" }
)
-- R heading
vim.keymap.set(
  "n",
  "<leader>Rh",
  [[i---<CR>title: ""<CR>author: ""<CR>date: "`r Sys.Date()`"<CR>output: html_document<CR>---<CR><CR>```{r setup, include=FALSE}<CR>knitr::opts_chunk$set(echo = TRUE)<CR>```<CR><CR>---<CR><CR>]],
  { desc = "R Header" }
)
-- undo tree (muntree)
vim.keymap.set("n", "<leader>ut", [[:UndotreeToggle <cr><c-w>h]], { silent = true, desc = "Undo [T]ree" })

-- view alpha (homescreen) buffer
vim.keymap.set("n", "<leader>A", [[:Alpha<CR>]], { silent = true })

-- markdown preview
vim.keymap.set("n", "<leader>mp", [[:MarkdownPreview<CR>]], { silent = true, desc = "Markdown [P]review" })

-- remove weid symbol (^ M) on paste
vim.api.nvim_set_keymap("n", "<leader>p", "<CMD>%s/\\r//<CR>", { desc = "Fix paste", silent = true })

-- support for ranger plugin
vim.keymap.set("n", "<leader>e", "<CMD>RnvimrToggle<CR>", { silent = true, desc = "[E]xplore" })

-- support for markdown table mode
vim.keymap.set("n", "<leader>mtm", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Table [M]ode" })
-- window rotate
vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window [R]otate" })
-- markdown table of contents
vim.keymap.set("n", "<leader>mtc", "<CMD>Toc<CR><CMD>set nornu<CR>", { silent = true, desc = "TOC" })

-- get one dark pro colors (kinda useless)
vim.keymap.set(
  "n",
  "<leader>ug",
  "<CMD>OnedarkproColors<CR>VGy<CMD>bd<CR>pvip:norm 0i-- <CR>",
  { silent = true, noremap = false, desc = "[G]et Theme Colors" }
)
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

-- tab for fold toggle
vim.keymap.set("n", "<tab>", "za", { silent = true, desc = "Fold by indent" })

-- nb sync
vim.keymap.set("n", "<leader>gn", "<CMD>!nb sync<CR>", { desc = "Sync with [n]b" })

--spider keymaps
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- delete and save to register
vim.keymap.set("v", "<leader>d", "ygvd", { desc = "Vim Delete", silent = true })
vim.keymap.set("n", "<leader>d", "yydd", { desc = "Vim Delete", silent = true })

-- open terminal buffer in split
vim.keymap.set("n", "<leader>T", "<cmd>vsp | term<cr><cmd>set nornu | set nonu<cr>a", { desc = "Terminal Split" })

-- increment and decrements
vim.keymap.set("n", "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<C-x>", { noremap = true, silent = true })
