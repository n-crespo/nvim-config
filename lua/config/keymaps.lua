-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- centers c-d and c-u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Go Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Go Up" })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { noremap = true, desc = "Next jumplist" })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { noremap = true, desc = "Previous jumplist" })
vim.keymap.set("n", "G", "Gzz", { noremap = true, desc = "End of File" })

-- centers search function
vim.keymap.set("n", "n", "nzzzv", { noremap = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, desc = "Previous Search Result" })

-- allow changing and deleting without overriding current paste registers
-- in other words automatically delete or change to the void register
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true, desc = "Delete till end of line" })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete" })

vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true, silent = true, desc = "Change till end of line" })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true, desc = "Change" })

vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true, desc = "Delete under cursor" })
vim.keymap.set("v", "p", '"_dp', { noremap = true, silent = true, desc = "Paste" })

-- adds <Control + backspace> and <Control + delete> to insert mode
vim.keymap.set("i", "", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-Del>", "<C-o>de")
vim.keymap.set("i", "<A-a>", "<C-o>A", { silent = true })

-- replace all instances of word (without LSP)
vim.keymap.set(
  "n",
  "<leader>ci",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace instances" }
)

-- remove all other windows, same as :on or :only
vim.keymap.set("n", "<leader>wo", [[:only <CR>]], { silent = true, desc = "Window only" })

-- window rotate
vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window rotate" })

-- don't let cursor fly around when using J
vim.keymap.set("n", "J", "mzJ`z<cmd>delm z<CR>", { silent = true, desc = "better J" })

-- center view port on Enter
vim.keymap.set("n", "<CR>", "<cmd>noh<cr><esc>zz", { noremap = false, silent = true, desc = "Center" })

-- open in windows system viewer (for WSL)
vim.keymap.set("n", "<leader>ow", "<cmd>!wsl-open %<cr>", { silent = true, desc = "Open in Windows System Viewer" })

-- open in system viewer (operating system)
vim.keymap.set("n", "<leader>os", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })

-- delete and save to register
vim.keymap.set("v", "<leader>d", "ygvd", { desc = "Delete to register", silent = true })
vim.keymap.set("n", "<leader>d", "yydd", { desc = "Delete to register", silent = true })

-- increment and decrements
vim.keymap.set("n", "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<C-x>", { noremap = true, silent = true })

-- select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Force save as sudo (for readonly files)
vim.keymap.set("n", "<leader>W", "<cmd>w !sudo tee %<cr>", { desc = "Force save", noremap = true, silent = true })

-- THIS IS AWESOME (in insert mode, <c-L> auto-corrects the last misspelled word
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Auto correct", silent = true })

-- delete all other buffers (body odor)
vim.keymap.set("n", "<leader>bo", "<cmd>w<cr><cmd>%bd|e#|bd#<cr>", { desc = "Buffer only", silent = true })

-- apply macro over selected region
vim.keymap.set("x", "Q", ":norm @q<cr>", { desc = "Play Q macro", silent = true })

-- cd to current buffer (replace autochdir)
vim.keymap.set("n", "<leader>bl", "<cmd>cd %:h<cr>", { desc = "Buffer locate", silent = true })

-- jumplist with backspace
vim.keymap.set("n", "<BS>", "<C-o>", { desc = "Back", silent = true })

-- clear line
vim.keymap.set("n", "X", "0D", { desc = "Clear Line", silent = true })

-- unholy non-native vim keymap
vim.keymap.set("n", "<C-f>", "<leader>sb", { remap = true, desc = "Find word" })

-- new buffer (vertical split)
vim.keymap.set("n", "<C-n>", "<cmd>vnew<cr>", { remap = true, desc = "New buffer" })

-- pick from buffers
vim.keymap.set("n", "<C-p>", "<leader>,", { remap = true, desc = "Pick buffer" })

-- what is even this
vim.keymap.del("n", "<leader>K")
