-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- centers c-d and c-u
local Util = require("lazyvim.util")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- centers search function
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-i>", "<C-o>")
vim.keymap.set("n", "<C-o>", "<C-i>")

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
  Util.terminal.open()
end, {})

--======================--
-- Start [R]un Keymaps
--======================--
vim.keymap.set(
  "n",
  "<leader>rp",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> python4 <C-\><C-n>"#pi<CR> ]],
  { silent = true, desc = "Run [P]ython File" }
)

vim.keymap.set(
  "n",
  "<leader>rj",
  [[:set autochdir<CR>:w<CR>:FloatingTerm<CR>javac <C-\><C-n>"#pi && java <C-\><C-n>"#pi<BS><BS><BS><BS><BS><CR> ]],
  { silent = true, desc = "Run [J]ava File" }
)

vim.keymap.set(
  "n",
  "<leader>rc",
  [[:set autochdir<CR>:w<CR>:FloatingTerm <CR> g++ -o <C-\><C-n>"#pi<BS><BS><BS><BS> <C-\><C-n>"#pi && ./<C-\><C-n>"#pi<BS><BS><BS><BS><CR> ]],
  { desc = "Run [C]++ File", silent = true }
)
--====================--
-- End [R]un Keymaps
--====================--

--======================--
-- Start Harpoon Keymaps
--======================--
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63699c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#8aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#8aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")

-- add to list
vim.keymap.set("n", "<a-a>", mark.add_file)
-- show list
vim.keymap.set("n", "<a-e>", ui.toggle_quick_menu)

--navigate to first in list
vim.keymap.set("n", "<a-q>", function()
  ui.nav_file(2)
end)

--navigate to second in list
vim.keymap.set("n", "<a-w>", function()
  ui.nav_file(3)
end)

--navigate to third in list
vim.keymap.set("n", "<a-d>", function()
  ui.nav_file(4)
end)

--navigate to fourth in list
vim.keymap.set("n", "<a-x>", function()
  ui.nav_file(5)
end)

--====================--
-- End Harpoon Keymaps
--====================--

--=================================--
-- Start Goyo (and Lualine) Keymaps
--=================================--

-- functions for hiding and showing lualine for goyo
vim.api.nvim_create_user_command("HideLualine", function()
  require("lualine").hide({ place = { "statusline" }, unhide = false })
end, {})
vim.api.nvim_create_user_command("ShowLualine", function()
  require("lualine").hide({ place = { "statusline" }, unhide = true })
end, {})

-- Toggling lualine
vim.keymap.set("n", "<leader>ub", "[[:ShowLualine<CR>]]", { silent = true, desc = "Enable Status [B]ar" })
vim.keymap.set("n", "<leader>uB", "[[:HideLualine<CR>]]", { silent = true, desc = "Disable Status [B]ar" })

-- goyo enable
vim.keymap.set(
  "n",
  "<leader>ge",
  "[[:set nocursorline<CR>:set linebreak<CR>:set wrap<CR>:HideLualine<CR>:Goyo 51%<CR>]]",
  { silent = true, desc = "[E]nable [G]oyo" }
)

--  Goyo disable
vim.keymap.set(
  "n",
  "<leader>gd",
  "[[:set nocursorline<CR>:ShowLualine<CR>:Goyo!<CR>]]",
  { silent = true, desc = "[D]isable [G]oyo" }
)

--=================================--
-- End Goyo (and Lualine) Keymaps
--=================================--

--======================--
-- Miscellaneous Keymaps
--======================--

-- telescope find plugin files
vim.keymap.set("n", "<leader>fp", function()
  require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
end, { silent = true, desc = "[F]ind [P]lugin File" })

-- 3
-- This conflicts with vim's <C-a> key map that increments selected numbers, but
-- I think it is a worth trade-off because <C-a> to select the whole file is so common
-- in every other application I use. (C-x decrements numbers)
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select [A]ll" })

-- adds <Control + backspace> and <Control + delete> to insert mode
vim.keymap.set("i", "", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-Del>", "<C-o>de")

-- cd to current buffer directory
vim.keymap.set("n", "<leader>bl", "[[<CMD>cd %:p:h<CR>]]", { silent = true, desc = "[B]uffer [L]ocate" })

-- replace word
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
vim.keymap.set("n", "<leader>Rk", [[:w <cr>:RMarkdown <CR>]], { silent = true, desc = "R Knit" })
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

-- vim.keymap.set("i", "<a-i>", "<esc>I", { desc = "[I]nsert at start of line" })
-- better insert mode keymaps
vim.keymap.set("i", "<a-a>", "<esc>A", { desc = "[A]ppend to end of line" })

-- go to markdown link (gl) ([g]o [l]ink)
vim.keymap.set(
  "n",
  "gl",
  "/\\[.*\\](.*)<CR><ESC>/master<CR><ESC>wwvt)gf<CMD>noh<CR>",
  { silent = true, desc = "Goto Markdown [L]ink" }
)

-- -- create markdown heading
-- vim.keymap.set(
--   "n",
--   "<leader>mh",
--   'ggO<ESC>"%pa<bs><bs><bs><ESC>F/dbxyypVr=',
--   { desc = "[H]eading (from notebook directory)" }
-- )

vim.keymap.set(
  "n",
  "<leader>mh",
  "ggO<ESC><CMD>r! echo %:t<CR>A<bs><bs><bs><ESC>kddyypVr=",
  { silent = true, desc = "Markdown [H]eading" }
)

-- add "=" underline in markdown with current line (for h1)
vim.keymap.set("n", "gh", "yypVr=", { silent = true, desc = "Add '=' for Markdown h1" })

-- NOTE: the below keymap is unneeded because of new markdown plugin

-- -- create markdown link with bracketed text
-- vim.keymap.set(
--   "n",
--   "<leader>ml",
--   "f]a(word)<ESC>hciwhttps://github.com/n-crespo/NASA-2023/blob/master/",
--   { silent = true, desc = "Create Github [L]ink" }
-- )

function _G.change_directory()
  local filepath = vim.fn.expand("%:p") -- get path of the current file
  local path = vim.fn.fnamemodify(filepath, ":h") -- get directory of the file
  local filename = vim.fn.fnamemodify(filepath, ":t") -- get name of the file

  vim.cmd("new") -- create a new split
  vim.fn.termopen("wezterm start --cwd " .. path .. " wezterm imgcat " .. filename) -- start terminal with the command
end

vim.api.nvim_set_keymap("n", "<leader>cv", ":lua change_directory()<CR>", { noremap = true, silent = true })
