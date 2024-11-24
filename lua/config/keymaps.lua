-- media control buttons (don't send keypresses)
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- volume up
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- volume down
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- mute
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- mute
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- prev
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- skip

-- --------------------------------------- BETTER MOTIONS ---------------------------------------

-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Half Page Down" })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Half Page Up" })
-- vim.keymap.set("n", "G", "Gzz", { noremap = true, desc = "End of File" })
-- vim.keymap.set("n", "n", "nzzzv", { noremap = true, desc = "Next Search Result" })
-- vim.keymap.set("n", "N", "Nzzzv", { noremap = true, desc = "Prev Search Result" })
--
-- don't let cursor fly around when using J
vim.keymap.set("n", "J", "mzJ`z<cmd>delm z<CR>", { silent = true, desc = "better J" })

-- go to visual end of line unless wrap is disabled!!
vim.keymap.set({ "n", "v", "o" }, "E", function()
  if vim.opt.wrap:get() then
    vim.cmd("normal! g$")
  else
    vim.cmd("normal! $")
  end
end, { desc = "End of line", silent = true })

vim.keymap.set({ "n", "v", "o" }, "B", function()
  if vim.opt.wrap:get() then
    vim.cmd("normal! g^")
  else
    vim.cmd("normal! ^")
  end
end, { desc = "Start of line", silent = true })

-- --------------------------------------- PASTING + REGISTERS -------------------------------------

-- allow changing and deleting without overriding current paste registers
-- in other words automatically delete or change to the void register
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true, desc = "Delete till end of line" })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete" })
vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true, silent = true, desc = "Change till end of line" })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true, desc = "Change" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true, desc = "Delete under cursor" })
vim.keymap.set("v", "p", '"_dp', { noremap = true, silent = true, desc = "Paste" })
vim.keymap.set("n", "X", "0D", { remap = true, desc = "Clear Line", silent = true })

-- delete to register
vim.keymap.set("v", "<leader>d", '"+d', { desc = "Cut", silent = true, remap = false })
vim.keymap.set("n", "<leader>d", '"+dd', { desc = "Cut", silent = true })

-- paste from system clipboard
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.keymap.set("c", "<C-v>", "<C-r>+")

-- select last changed/yanked text
vim.keymap.set(
  "n",
  "gV",
  '"`[" . strpart(getregtype(), 0, 1) . "`]"',
  { expr = true, replace_keycodes = false, desc = "Visually select changed text" }
)

-- --------------------------------------- WINDOWS BUFFERS AND TABS --------------------------------

-- tab navigation
vim.keymap.set("n", "<S-h>", "<cmd>tabprev<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<S-l>", "<cmd>tabnext<cr>", { desc = "Next Tab" })

vim.keymap.set("n", "<leader><Tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- delete all other {something} (tab, buffer, window)
vim.keymap.set("n", "<leader>wo", "<cmd>only <CR>", { silent = true, desc = "Window only" })

-- needed because I override <C-w>
vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window rotate" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Other Window", silent = true })

-- cd to current buffer (replace autochdir)
vim.keymap.set("n", "<leader>bl", function()
  vim.cmd([[cd %:h]])
  vim.notify(vim.fn.getcwd(), vim.log.levels.INFO, {
    title = "Buffer Locate",
  })
end, { desc = "Buffer Locate", silent = true })

-- close buffer (not soft) (don't preserve split)
-- vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "quit", silent = true })
vim.keymap.set("n", "<leader>q", "<C-W>c", { desc = "quit", silent = true })

-- splits
-- vim.keymap.set("n", "\\", "<cmd>vsplit<cr>", { remap = true, silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { remap = true, silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "_", "<cmd>split<cr>", { remap = true, silent = true, desc = "Vertical Split" })

-- window resizing (<C-up> and <C-down> are used by multicursor)
vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })

-- vim.keymap.set("n", "<leader>bo", ":%bd|e#<cr>", { desc = "Buffer Only", silent = true })

vim.keymap.set("n", "<leader>os", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })
-- --------------------------------- TAB RELATED STUFF --------------------------------------------

vim.keymap.set("n", "<C-space>", "<cmd>$tabnew<cr>")
vim.keymap.set("n", "<leader>1", "<cmd>tabn 1<cr>", { silent = true, desc = "Tab 1" })
vim.keymap.set("n", "<leader>2", "<cmd>tabn 2<cr>", { silent = true, desc = "Tab 2" })
vim.keymap.set("n", "<leader>3", "<cmd>tabn 3<cr>", { silent = true, desc = "Tab 3" })
vim.keymap.set("n", "<leader>4", "<cmd>tabn 4<cr>", { silent = true, desc = "Tab 4" })
vim.keymap.set("n", "<leader>5", "<cmd>tabn 5<cr>", { silent = true, desc = "Tab 5" })

-- --------------------------------- INSERT MODE + COMPLETION -------------------------------------

-- completion cycling in command mode
vim.keymap.set("c", "<C-j>", "<C-n>", { remap = true, desc = "Cycle through completion items" })
vim.keymap.set("c", "<C-k>", "<C-p>", { remap = true, desc = "Cycle through completion items" })

-- in insert mode auto-correct the last misspelled word
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Auto Correct", silent = true })
vim.keymap.set("i", "<C-Del>", "<C-o>de") -- traditional functionality of <C-delete>
vim.keymap.set("i", "<M-BS>", "<C-u>", { desc = "Clear Line" })
vim.keymap.set("n", "<M-BS>", "<NOP>", { desc = "Clear Line" })
vim.keymap.set("i", "<S-CR>", "<esc>o", { remap = false })

-- backspace to clear snippets
vim.keymap.set("s", "<BS>", "<C-O>c", { remap = true })

-- --------------------------------- PLUGIN SPECIFIC KEYMAPS ---------------------------------------

-- zb but respect scrollEOF plugin
vim.keymap.set("n", "zb", "zbkj", { silent = true, desc = "Bottom line" })

-- git blame
vim.keymap.set("n", "gb", "<leader>gb", { remap = true, silent = true, desc = "Blame Line" })

-- unholy non-native vim keymap for find in buffer
vim.keymap.set("n", "<C-f>", function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require("telescope.themes").get_dropdown({ winblend = 0, previewer = false })
  )
end, { desc = "find word" })

-- move lines up and down (mini.move)
vim.keymap.set({ "n", "v" }, "<C-n>", "<M-j>", { remap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-p>", "<M-k>", { remap = true, silent = true })

-- git hunks
vim.keymap.set("n", "gp", "<leader>ghp", { remap = true, desc = "git preview" })

vim.keymap.set(
  "x",
  "'",
  [[:s/\%V\(.*\)\%V/'\1'/ <CR><cmd>noh<cr>]],
  { desc = "Surround selection with '", silent = true }
)
vim.keymap.set(
  "x",
  '"',
  [[:s/\%V\(.*\)\%V/"\1"/ <CR><cmd>noh<cr>]],
  { desc = 'Surround selection with "', silent = true }
)
vim.keymap.set(
  "x",
  "*",
  [[:s/\%V\(.*\)\%V/*\1*/ <CR><cmd>noh<cr>]],
  { desc = "Surround selection with *", silent = true }
)
vim.keymap.set(
  "x",
  "_",
  [[:s/\%V\(.*\)\%V/_\1_/ <CR><cmd>noh<cr>]],
  { desc = "Surround selection with _", silent = true }
)
vim.keymap.set(
  "x",
  "q",
  [[:s/\%V\(.*\)\%V/"\1"/ <CR><cmd>noh<cr>]],
  { desc = "Surround selection with quotes", silent = true }
)

-- vim.keymap.set("n", "<leader>s*", [[:s/\<<C-r><C-w>\>/*<C-r><C-w>\*/ <CR>]], { desc = "Surround word with *" })
-- vim.keymap.set("n", '<leader>s"', [[:s/\<<C-r><C-w>\>/"<C-r><C-w>\"/ <CR>]], { desc = 'Surround word with "' })
-- vim.keymap.set("n", "<leader>s'", [[:s/\<<C-r><C-w>\>/'<C-r><C-w>\'/ <CR>]], { desc = "Surround word with '" })

-- ------------------------------------- PERMISSIONS -----------------------------------------------

-- Force save as sudo (for readonly files)
vim.keymap.set("n", "<leader>W", "<cmd>w !sudo tee %<cr>", { desc = "Force Save File", noremap = true, silent = true })

-- grant permissions
vim.keymap.set("n", "<leader>X", "<Cmd>!sudo chmod +x %<CR>", { silent = true, desc = "Grant File Permissions" })

-- --------------------------------- TERMINAL KEYMAPS-----------------------------------------------

-- clear terminal (overriding <C-l> for window navigation)
vim.keymap.set("t", "<C-l>", "<C-l>", { noremap = true })

-- restore original terminal keymap behavior
vim.keymap.set("t", "<C-k>", "<C-k>", { noremap = true })
vim.keymap.set("t", "<C-j>", "<C-j>", { noremap = true })
vim.keymap.set({ "t", "n" }, "<C-S-H>", "<cmd>wincmd h<cr>", { noremap = true })
vim.keymap.set({ "t", "n" }, "<C-S-L>", "<cmd>wincmd l<cr>", { noremap = true })
vim.keymap.set({ "t", "n" }, "<C-S-J>", "<cmd>wincmd j<cr>", { noremap = true }) -- this doesn't work
vim.keymap.set({ "t", "n" }, "<S-NL>", "<cmd>wincmd j<cr>", { noremap = true }) -- this does?
vim.keymap.set({ "t", "n" }, "<C-S-K>", "<cmd>wincmd k<cr>", { noremap = true })

-- ------------------------------------- ABBREVIATIONS --------------------------------------------

-- note: these will work in every filetype
local abbrevations = {
  { "dont", "don't" },
  { "shouldnt", "shouldn't" },
  { "cant", "can't" },
  { "wont", "won't" },
  { "wouldnt", "wouldn't" },
  { "seperate", "separate" },
  { "teh", "the" },
  { "thats", "that's" },
  { "itll", "it'll" },
}
for _, v in ipairs(abbrevations) do
  vim.cmd(string.format("iabbrev %s %s", v[1], v[2]))
end

vim.cmd("cnoreabbrev Set  set")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")

vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("E", "e", { nargs = 0 })
vim.api.nvim_create_user_command("Q", "qa", { nargs = 0 })
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("WQ", "wq", { nargs = 0 })

-- ------------------------------------- MISC KEYMAPS ----------------------------------------------

-- apply macro over selected region
vim.keymap.set("x", "Q", ":norm @q<cr>", { desc = "Play Q Macro", silent = true })

-- replace all instances of word (without LSP)
vim.keymap.set(
  "n",
  "<leader>ci",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace instances" }
)

vim.keymap.set(
  "n",
  "<leader>cI",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]],
  { desc = "Replace instances with confirmation" }
)

-- : (easier to hit when using in combination with <C-k>)
vim.keymap.set({ "n", "v" }, "<C-;>", ":", { remap = true, silent = false, desc = "Commmand Mode" })
vim.keymap.set({ "n", "v" }, "<C-x>", ":", { remap = true, silent = false, desc = "Commmand Mode" }) -- NOTE; this (in alacritty) is <C-;>

-- increment and decrement with plus and minus (since I override <C-a>)
vim.keymap.set({ "n", "v" }, "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "-", "<C-x>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

-- follow links better
vim.keymap.set("n", "gx", "<cmd>sil !open <cWORD><cr>", { silent = true, desc = "Follow Link" })

-- Use ` to fold when in normal mode
-- To see help about folds use `:help fold`
vim.keymap.set({ "n", "v" }, "`", function()
  -- Get the current line number
  local line = vim.fn.line(".")
  -- Get the fold level of the current line
  local foldlevel = vim.fn.foldlevel(line)
  if foldlevel == 0 then
    vim.notify("No fold found", vim.log.levels.WARN, { title = "Fold" })
  else
    vim.cmd("normal! za")
  end
end, { desc = "Toggle fold" })

-- toggling comments
vim.keymap.set({ "n", "i" }, "<C-/>", "<cmd>normal gcc<CR>", { desc = "[/] Toggle comment line", silent = true })
vim.keymap.set("v", "<C-/>", "<cmd>normal gcc<CR>gv", { desc = "[/] Toggle comment line", silent = true })

vim.keymap.set({ "n", "i" }, "<C-_>", "<cmd>normal gcc<CR>", { desc = "[/] Toggle comment line", silent = true })
vim.keymap.set("v", "<C-_>", "<cmd>normal gcc<CR>gv", { desc = "[/] Toggle comment line", silent = true })

-- clean ^Ms (windows newlines)
vim.keymap.set("n", "<C-S-S>", function()
  vim.cmd([[silent! %s/\r//g]])
  vim.cmd([[w]])
  vim.notify("Cleaned all newline characters!", vim.log.levels.INFO, { title = "File Saved" })
end, { remap = false, desc = "Clean ^M", silent = true })

-- get word count of current file
vim.keymap.set("n", "<C-S-C>", function()
  vim.notify("" .. vim.fn.wordcount().words, vim.log.levels.INFO, {
    title = "Word Count",
  })
end)

-- z=
local spell_on_choice = vim.schedule_wrap(function(_, idx)
  if type(idx) == "number" then
    vim.cmd.normal({ idx .. "z=", bang = true })
  end
end)
local spell_select = function()
  if vim.v.count > 0 then
    spell_on_choice(nil, vim.v.count)
    return
  end
  local cword = vim.fn.expand("<cword>")
  vim.ui.select(vim.fn.spellsuggest(cword, vim.o.lines), { prompt = "Change " .. cword .. " to:" }, spell_on_choice)
end
vim.keymap.set("n", "z=", spell_select, { desc = "Show spelling suggestions" })
vim.keymap.set("n", "<leader>fs", "1z=", { noremap = true, silent = true, desc = "Fix Spelling under cursor" })

-- reopen closed buffer/window
vim.keymap.set("n", "<C-S-T>", "<cmd>vsp | e #<cr>", { desc = "Re-open last buffer" })
