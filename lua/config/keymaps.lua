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

vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })

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

-- Bufferline Keymaps --
--====================--

-- Require the bufferline plugin
local bufferline = require("bufferline")

-- Set some options for bufferline
---@diagnostic disable-next-line: missing-fields
bufferline.setup({
  ---@diagnostic disable-next-line: missing-fields
  options = {
    -- Enable mouse clicks on the bufferline
    mouse = true,
    -- Use letters for buffer pick functionality
    buffer_pick_command = "Telescope buffers",
  },
})

-- Map <Alt-q> to switch to the first tab in normal mode
vim.api.nvim_set_keymap("n", "<A-q>", "<cmd>BufferLineGoToBuffer 1<CR>", { noremap = true })
-- Map <Alt-w> to switch to the second tab in normal mode
vim.api.nvim_set_keymap("n", "<A-w>", "<cmd>BufferLineGoToBuffer 2<CR>", { noremap = true })
-- Map <Alt-d> to switch to the third tab in normal mode
vim.api.nvim_set_keymap("n", "<A-e>", "<cmd>BufferLineGoToBuffer 3<CR>", { noremap = true })
-- Map <Alt-x> to switch to the fourth tab in normal mode
vim.api.nvim_set_keymap("n", "<A-d>", "<cmd>BufferLineGoToBuffer 4<CR>", { noremap = true })

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
  "[[:set nocursorline<CR>:set linebreak<CR>:set wrap<CR>:HideLualine<CR>:Goyo 90<CR>]]",
  { silent = true, desc = "[E]nable [G]oyo" }
)

--  Goyo disable
vim.keymap.set(
  "n",
  "<leader>gd",
  "[[:set nocursorline<CR>:ShowLualine<CR>:Goyo!<CR>]]",
  { silent = true, desc = "[D]isable [G]oyo" }
)

--======================--
-- Miscellaneous Keymaps
--======================--

-- telescope find plugin files
vim.keymap.set("n", "<leader>fp", function()
  require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
end, { silent = true, desc = "[F]ind [P]lugin File" })

-- This conflicts with vim's <C-a> key map that increments selected numbers, but
-- I think it is a worth trade-off because <C-a> to select the whole file is so common
-- in every other application I use. (C-x decrements numbers)
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select [A]ll" })

-- adds <Control + backspace> and <Control + delete> to insert mode
vim.keymap.set("i", "", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-Del>", "<C-o>de")
vim.keymap.set("i", "<Alt-a>", "<C-o>A", { silent = true })

-- cd to current buffer directory
vim.keymap.set("n", "<leader>bl", "[[<CMD>cd %:p:h<CR>]]", { silent = true, desc = "[L]ocate Buffer" })

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
vim.keymap.set("n", "<leader>Rkh", [[:w <cr>:RMarkdown html<CR>]], { silent = true, desc = "R Knit html" })
vim.keymap.set(
  "n",
  "<leader>Rkp",
  [[:w <cr>:RMarkdown pdf latex_engine="xelatex"<CR>]],
  { silent = true, desc = "R Knit pdf" }
)
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

vim.keymap.set(
  "n",
  "<leader>mh",
  "ggO<ESC><CMD>r! echo %:t<CR>A<bs><bs><bs><ESC>kddyypVr=",
  { silent = true, desc = "Markdown [H]eading" }
)

-- add "=" underline in markdown with current line (for h1)
vim.keymap.set("n", "gh", "yypVr=", { silent = true, desc = "Add '=' for Markdown h1" })

-- view images with imgcat
function _G.spawn_image()
  local filepath = vim.fn.expand("%:p") -- get path of the current file
  local path = vim.fn.fnamemodify(filepath, ":h") -- get directory of the file
  local filename = vim.fn.fnamemodify(filepath, ":t") -- get name of the file

  vim.cmd("new") -- create a new split
  vim.fn.termopen("wezterm start --cwd " .. path .. " wezterm imgcat " .. filename) -- start terminal with the command
end

vim.api.nvim_set_keymap("n", "<leader>cv", ":lua spawn_image()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "p", "p<CMD>%s/\\r//<CR>", { desc = "Better paste", silent = true })

vim.keymap.set("n", "<leader>d", "d", { silent = true, desc = "Delete to Register", noremap = true })
vim.keymap.set("n", "<leader>bx", "<CMD>bd<CR>", { silent = true, desc = "Delete Buffer AND Split", noremap = false })

-- support for ranger plugin
vim.keymap.set("n", "<leader>e", "<CMD>RnvimrToggle<CR>", { silent = true, desc = "Ranger File [E]xplorer" })

-- support for markdown table mode
vim.keymap.set("n", "<leader>mt", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Markdown [T]able Mode" })
-- window rotate
vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window [R]otate" })
-- markdown table of contents
vim.keymap.set("n", "<leader>mc", "<CMD>Toc<CR><CMD>set nonu<CR>", { silent = true, desc = "Table of [C]ontents" })

-- get one dark pro colors
vim.keymap.set(
  "n",
  "<leader>ug",
  "<CMD>OnedarkproColors<CR>VGy<CMD>bd<CR>pvip:norm 0i-- <CR>",
  { silent = true, noremap = false, desc = "[G]et Theme Colors" }
)
-- don't let cursor fly around when using J
vim.keymap.set("n", "J", "mzJ`z", { silent = true, desc = "better J" })
-- center on save
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>zz", { desc = "Save file" })
-- better z<CR>
vim.keymap.set("n", "z<CR>", "zt", { desc = "Top this line" })
