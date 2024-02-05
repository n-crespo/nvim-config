-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- centers c-d and c-u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Go Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Go Up" })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { noremap = true, desc = "Next Jumplist" })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { noremap = true, desc = "Prev Jumplist" })

vim.keymap.set("n", "gx", "<cmd>sil !open <cWORD><cr>", { silent = true, desc = "Follow Link" })

vim.keymap.set("n", "}", "}zz", { noremap = true })
vim.keymap.set("n", "{", "{zz", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true, desc = "End of File" })

-- centers search function
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

-- open in windows system viewer (for WSL)
vim.keymap.set("n", "<leader>ow", "<cmd>!wsl-open %<cr>", { silent = true, desc = "Open in Windows System Viewer" })

-- open in system viewer (operating system)
vim.keymap.set("n", "<leader>os", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })

-- delete and save to register
vim.keymap.set("v", "<leader>d", "ygvd", { desc = "Delete to Register", silent = true })
vim.keymap.set("n", "<leader>d", "yydd", { desc = "Delete to Register", silent = true })

-- increment and decrements
vim.keymap.set("n", "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<C-x>", { noremap = true, silent = true })

-- select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

-- Force save as sudo (for readonly files)
vim.keymap.set("n", "<leader>W", "<cmd>w !sudo tee %<cr>", { desc = "Force Save", noremap = true, silent = true })

-- in insert mode, <C-l> auto-corrects the last misspelled word (on files that don't block spellcheck)
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Auto Correct", silent = true })

-- delete all other buffers (body odor)
vim.keymap.set("n", "<leader>bo", "<cmd>w<cr><cmd>%bd|e#|bd#<cr>", { desc = "Buffer Only", silent = true })

-- apply macro over selected region
vim.keymap.set("x", "Q", ":norm @q<cr>", { desc = "Play Q Macro", silent = true })

-- cd to current buffer (replace autochdir)
vim.keymap.set("n", "<leader>bl", "<cmd>cd %:h<cr>", { desc = "Buffer Locate", silent = true })

-- jumplist with backspace
vim.keymap.set("n", "<BS>", "<C-o>", { desc = "Prev Jumplist", silent = true })

-- clear line
vim.keymap.set("n", "X", "0D", { remap = true, desc = "Clear Line", silent = true })

-- unholy non-native vim keymap
vim.keymap.set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find Word" })

-- new buffer (vertical split)
vim.keymap.set("n", "<C-n>", "<cmd>vnew<cr>", { desc = "New Buffer" })

-- pick from buffers
vim.keymap.set(
  "n",
  "<C-p>",
  "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
  { remap = true, desc = "Pick Buffer" }
)

-- what is even this
vim.keymap.del("n", "<leader>K")

-- open file (use <Backspace> and <Tab> to navigate jump list)
vim.keymap.set("n", "<C-o>", "<C-q><C-o>", { remap = true, desc = "Open File", silent = true })

-- send buffer to vertical split (split left)
vim.keymap.set("n", "<leader>sl", "<leader>|<C-h><S-h><C-l>", { remap = true, desc = "Send to Split", silent = true })

-- other window
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Other Window", silent = true })

-- clear terminal (AMAZING)
vim.keymap.set("t", "<C-l>", "<C-l>", { noremap = true })

-- full line navigation
vim.keymap.set("n", "E", "g_", { desc = "End of line", silent = true })
vim.keymap.set("v", "E", "g_", { desc = "End of line", silent = true })
vim.keymap.set("n", "B", "_", { desc = "Start of line", silent = true })
vim.keymap.set("v", "B", "_", { desc = "Start of line", silent = true })

-- unneeded
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>qd")
vim.keymap.del("n", "<leader>qs")
vim.keymap.del("n", "<leader>ub")
vim.keymap.del("n", "<leader>ss")
vim.keymap.del("n", "<leader>sG")
vim.keymap.del("n", "<leader>sS")
vim.keymap.del("n", "<leader>sT")
vim.keymap.del("n", "<leader>sb")
