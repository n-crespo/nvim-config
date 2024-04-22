-- center big motions
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { noremap = true, desc = "Go Down" })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { noremap = true, desc = "Go Up" })
vim.keymap.set("n", "}", "}zz", { noremap = true })
vim.keymap.set("n", "{", "{zz", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true, desc = "End of File" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, desc = "Prev Search Result" })

-- allow changing and deleting without overriding current paste registers
-- in other words automatically delete or change to the void register
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true, desc = "Delete till end of line" })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete" })
vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true, silent = true, desc = "Change till end of line" })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true, desc = "Change" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true, desc = "Delete under cursor" })
vim.keymap.set("v", "p", '"_dp', { noremap = true, silent = true, desc = "Paste" })

vim.keymap.set("n", "<leader>wo", [[:only <CR>]], { silent = true, desc = "Window only" })
vim.keymap.set("n", "<leader>bo", "<cmd>w<cr><cmd>%bd|e#|bd#<cr>", { desc = "Buffer Only", silent = true }) -- delete all other buffers (body odor)

vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window rotate" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Other Window", silent = true })
vim.keymap.set("n", "<leader>ow", "<cmd>!wsl-open %<cr>", { silent = true, desc = "Open in Windows System Viewer" })
vim.keymap.set("n", "<leader>os", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })

vim.keymap.set("v", "<leader>d", "ygvd", { desc = "Delete to Paste Register", silent = true })
vim.keymap.set("n", "<leader>d", "yydd", { desc = "Delete to Paste Register", silent = true })
vim.keymap.set("n", "X", "0D", { remap = true, desc = "Clear Line", silent = true })

-- increment and decrements
vim.keymap.set({ "n", "v" }, "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "-", "<C-x>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

-- unholy non-native vim keymap
vim.keymap.set("n", "<C-f>", function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require("telescope.themes").get_dropdown({ winblend = 0, previewer = false })
  )
end, { desc = "Find Word" })

-- full line navigation
vim.keymap.set({ "n", "v" }, "E", "$", { desc = "End of line", silent = true })
vim.keymap.set({ "n", "v" }, "B", "_", { desc = "Start of line", silent = true })

-- unneeded
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>K")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>sb")

-- these are used because LWin+j, k, h, and l are mapped to the arrow keys and
-- LWin+u and d are mapped to page up and page down (via autohotkey)
local path = os.getenv("HOME") -- Get the user's home directory
if string.sub(path, 1, 6) == "/Users" then
  vim.notify("Keymaps not set, MacOS detected")
  vim.keymap.set("n", "<leader>ow", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })
  vim.keymap.set("n", "<leader>os", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })
else
  vim.keymap.set("n", "<leader>ow", "<cmd>!wsl-open %<cr>", { silent = true, desc = "Open in Windows System Viewer" })
  vim.keymap.set({ "n", "v" }, "<Up>", "<M-k>", { remap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<Down>", "<M-j>", { remap = true, silent = true })
  vim.keymap.set("n", "<PageUp>", "<C-u>zz", { silent = true })
  vim.keymap.set("n", "<PageDown>", "<C-d>zz", { silent = true })
end

-- cd to current buffer (replace autochdir)
vim.keymap.set("n", "<leader>bl", "<cmd>cd %:h<cr>", { desc = "Buffer Locate", silent = true })
-- close buffer (soft) (preserve split)
vim.keymap.set("n", "<leader>k", "<leader>bd", { remap = true, silent = true, desc = "Close Buffer" })

-- navigate and list tabs
vim.keymap.set("n", "<leader>a", function()
  vim.cmd("tabs")
end, { silent = true, desc = "List Tabs" })

-- completion cycling
vim.keymap.set("i", "<C-j>", "<C-n>", { remap = true, desc = "Cycle through completion items" })
vim.keymap.set("i", "<C-k>", "<C-p>", { remap = true, desc = "Cycle through completion items" })
vim.keymap.set("c", "<C-j>", "<C-n>", { remap = true, desc = "Cycle through completion items" })
vim.keymap.set("c", "<C-k>", "<C-p>", { remap = true, desc = "Cycle through completion items" })

-- follow links better
vim.keymap.set("n", "gx", "<cmd>sil !open <cWORD><cr>", { silent = true, desc = "Follow Link" })

-- select last changed/yanked text
vim.keymap.set(
  "n",
  "gV",
  '"`[" . strpart(getregtype(), 0, 1) . "`]"',
  { expr = true, replace_keycodes = false, desc = "Visually select changed text" }
)

-- don't let cursor fly around when using J
vim.keymap.set("n", "J", "mzJ`z<cmd>delm z<CR>", { silent = true, desc = "better J" })

-- Force save as sudo (for readonly files)
vim.keymap.set("n", "<leader>W", "<cmd>w !sudo tee %<cr>", { desc = "Force Save", noremap = true, silent = true })

-- in insert mode, <C-l> auto-corrects the last misspelled word (on files that don't block spellcheck)
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Auto Correct", silent = true })

-- apply macro over selected region
vim.keymap.set("x", "Q", ":norm @q<cr>", { desc = "Play Q Macro", silent = true })

-- jumplist with backspace
vim.keymap.set("n", "<BS>", "<C-o>", { desc = "Prev Jumplist", silent = true })

-- clear terminal (why is this not standard?)
vim.keymap.set("t", "<C-l>", "<C-l>", { noremap = true })

-- replace all instances of word (without LSP)
vim.keymap.set(
  "n",
  "<leader>ci",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace instances" }
)

vim.keymap.set("n", "<C-;>", ":")

-- paste from system clipboard
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.keymap.set("c", "<C-v>", "<C-r>+")

-- tab navigation (true tabs)
vim.keymap.set("n", "<S-L>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<S-H>", "<cmd>tabprev<cr>")
vim.keymap.set("n", "<C-Tab>", "<cmd>tabnext<cr>", { silent = true, desc = "Next Tab" })
vim.keymap.set("n", "<C-S-Tab>", "<cmd>tabprev<cr>", { silent = true, desc = "Previous Tab" })

-- vim.keymap.set("n", "<C-n>", "<Cmd>tabnew<cr>")
vim.keymap.del("n", "<C-w>Þ") -- to remove delay

-- close current tab, if last tab open, quit completely
vim.keymap.set("n", "<C-w>", function()
  ---@diagnostic disable-next-line: unused-local
  local success, result = pcall(function()
    vim.cmd("tabclose")
  end)
  if not success then
    vim.cmd("qa")
  end
end)

vim.keymap.set("n", "<C-t>", "<cmd>tabnew<cr>") -- i use <C-n> more tbh

vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close all other tabs", silent = true })

-- whichkey garbage
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("n", "<leader>qÞ")

-- :bd
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { desc = "Quit Buffer", silent = true })

-- settings keymap (init.lua)
vim.keymap.set("n", "<C-,>", "<cmd>e $MYVIMRC<cr>", { desc = "Edit vimrc", silent = true })

-- vertical split
vim.keymap.set("n", "<leader>\\", "<leader>|", { remap = true, silent = true, desc = "Vertical Split" })

-- zb but respect scrollEOF plugin
vim.keymap.set("n", "z-", "z-kj", { silent = true, desc = "Bottom line" })
vim.keymap.set("n", "zb", "zbkj", { silent = true, desc = "Bottom line" })

-- grant permissions
vim.keymap.set("n", "<leader>X", "<Cmd>!chmod +x %<CR>", { silent = true, desc = "Permissions" })

-- insert mode
vim.keymap.set("i", "<C-h>", "<left>") -- navigation

-- media control buttons (don't send keypresses)
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- volume up
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- volume down
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- mute
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- mute
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- prev
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- skip

vim.keymap.set("n", "<C-space>", "<cmd>tabnew<cr>")
