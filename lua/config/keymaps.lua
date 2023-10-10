-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

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
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "D", '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true })

vim.api.nvim_create_user_command("FloatingTerm", function()
  Util.float_term()
end, {})

-- 0
--

-- auto save on escape insert mode
-- vim.keymap.set("i", "<esc>", [[<esc>:set autochdir<CR>:w<CR>]], { silent = true })
vim.keymap.set(
  "n",
  "<leader>pp",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> python3 <C-\><C-n>"#pi<CR> ]],
  { silent = true, desc = "Run Python File" }
)
vim.keymap.set(
  "n",
  "<leader>jj",
  [[:set autochdir<CR>:w<CR>:FloatingTerm<CR>javac <C-\><C-n>"#pi && java <C-\><C-n>"#pi<BS><BS><BS><BS><BS><CR> ]],
  { silent = true, desc = "Run Java File" }
)

vim.keymap.set(
  "n",
  "<leader>cp",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> g++ -o <C-\><C-n>"#pi<BS><BS><BS><BS> <C-\><C-n>"#pi && ./<C-\><C-n>"#pi<BS><BS><BS><BS><CR> ]],
  { desc = "Run C++", silent = true }
)

-- replace word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace Word" })
-- open terminal buffer
vim.keymap.set("n", "<leader>tm", [[:term <cr>]], { desc = "Terminal Buffer" })
-- select full file
vim.keymap.set("n", "<C-s-a>", [[gg<S-v>G]])
-- r markdown code block
vim.keymap.set("n", "<leader>rb", [[i ```{r}<cr>```<esc>O]], { desc = "R Code Block", silent = true })
-- attempt to do colorscheme preview keymap
vim.keymap.set("n", "<leader>th", [[:Telescope colorscheme<cr>]], { silent = true })
-- undo tree (muntree)
vim.keymap.set("n", "<leader>ut", [[:UndotreeToggle <cr><c-w>h]], { silent = true, desc = "Undo Tree" })
-- remove all other windows, same as :on or :only
vim.keymap.set("n", "<leader>on", [[:only <CR>]], { silent = true, desc = ":only" })
-- view alpha (homescreen) buffer
vim.keymap.set("n", "<leader>A", [[:Alpha<CR>]], { silent = true })
-- close buffer and window
vim.keymap.set("n", "<leader>xc", [[:bdelete <CR>]], { silent = true, desc = "Close buffer" })

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
-- local term = require("harpoon.term")
-- local tmux = require("harpoon.tmux")

-- switching buffers
vim.keymap.set("n", "L", [[:bnext<CR>]], { silent = true, desc = "Next Buffer" })
vim.keymap.set("n", "H", [[:bprev<CR>]], { silent = true, desc = "Previous Buffer" })

-- harpoon
vim.keymap.set("n", "<a-a>", mark.add_file)
vim.keymap.set("n", "<a-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<a-q>", function()
  ui.nav_file(1)
end)

vim.keymap.set("n", "<a-w>", function()
  ui.nav_file(2)
end)

vim.keymap.set("n", "<a-d>", function()
  ui.nav_file(3)
end)

vim.keymap.set("n", "<a-x>", function()
  ui.nav_file(4)
end)
-- markdown preview
vim.keymap.set("n", "<leader>mp", [[:MarkdownPreview<CR>]], { silent = true, desc = "[M]arkdown [P]review" })

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")

-- better insert mode keymaps
vim.keymap.set("i", "<a-i>", "<esc>I", { desc = "[I]nsert at start of line" })
vim.keymap.set("i", "<a-a>", "<esc>A", { desc = "[A]ppend to end of line" })

-- enter in normal mode adds new line
-- vim.keymap.set("n", "<CR>", "o<esc>", { desc = "Add new line" })

-- functions for hiding and showing lualine for goyo
vim.api.nvim_create_user_command("HideLualine", function()
  require("lualine").hide({ place = { "statusline" }, unhide = false })
end, {})
vim.api.nvim_create_user_command("ShowLualine", function()
  require("lualine").hide({ place = { "statusline" }, unhide = true })
end, {})

-- goyo enable
vim.keymap.set(
  "n",
  "<leader>ge",
  "[[:set nocursorline<CR>:set linebreak<CR>:set wrap<CR>:HideLualine<CR>:Goyo 50%<CR>]]",
  { silent = true, desc = "[E]nable [G]oyo" }
)

--  Goyo disable
vim.keymap.set(
  "n",
  "<leader>gd",
  "[[:set nocursorline<CR>:ShowLualine<CR>:Goyo!<CR>]]",
  { silent = true, desc = "[D]isable [G]oyo" }
)

-- telescope find plugin files
vim.keymap.set("n", "<leader>fp", function()
  require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
end, { silent = true, desc = "[F]ind [P]lugin File" })

-- This conflicts with vim's <C-a> key map that increments selected numbers, but
-- I think it is a worth trade-off because <C-a> to select the whole file is so common
-- in every other application I use. (C-x decrements numbers)
vim.keymap.set("n", "<C-A>", "ggVG", { desc = "Select [A]ll" })

-- this adds <Control + backspace> and <Control + delete> to insert mode
vim.keymap.set("i", "", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-Del>", "<C-o>de")

-- show lualine
vim.keymap.set("n", "<leader>ub", "[[:ShowLualine<CR>]]", { silent = true, desc = "Toggle Status [B]ar" })

-------- START NEORG KEYBINDS ------------
-- new note
vim.keymap.set(
  "n",
  "<leader>nn",
  "[[:Neorg keybind all core.dirman.new.note<CR>]]",
  { silent = true, desc = "[N]ew [N]ote" }
)
