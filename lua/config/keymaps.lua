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
  { desc = "Replace [I]nstances" }
)

-- remove all other windows, same as :on or :only
vim.keymap.set("n", "<leader>wo", [[:only <CR>]], { silent = true, desc = "Window [O]nly" })

-- window rotate
vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window [R]otate" })

-- window window on the wall, tell me who is that windowest of them all
vim.keymap.set("n", "<leader>ww", "<C-w><C-w>", { silent = true, desc = "Window Window" })

-- don't let cursor fly around when using J
vim.keymap.set("n", "J", "mzJ`z<cmd>delm z<CR>", { silent = true, desc = "better J" })

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

-- increment and decrements
vim.keymap.set("n", "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<C-x>", { noremap = true, silent = true })

-- select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select [A]ll" })

-- Force save as sudo (for readonly files)
vim.keymap.set("n", "<leader>W", "<cmd>w !sudo tee %<cr>", { desc = "Force Save", noremap = true, silent = true })

-- Force remove buffer (and split)
vim.keymap.set("n", "<leader>bD", "<cmd>bd<cr>", { desc = "DELETE Buffer" })

-- THIS IS AWESOME (in insert mode, <c-L> auto-corrects the last misspelled word
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Auto Correct", silent = true })

vim.keymap.del("n", '<leader>s"')
vim.keymap.del("n", "<leader>sa")
vim.keymap.del("n", "<leader>sC")
vim.keymap.del("n", "<leader>sc")
vim.keymap.del("n", "<leader>sd")
vim.keymap.del("n", "<leader>sD")
vim.keymap.del("n", "<leader>sG")
vim.keymap.del("n", "<leader>sg")
vim.keymap.del("n", "<leader>sm")
vim.keymap.del("n", "<leader>ss")
vim.keymap.del("n", "<leader>sS")
vim.keymap.del("n", "<leader>st")
vim.keymap.del("n", "<leader>sT")
vim.keymap.del("n", "<leader>sw")
vim.keymap.del("n", "<leader>sW")
vim.keymap.del("n", "<leader>sna")
vim.keymap.del("n", "<leader>snd")
vim.keymap.del("n", "<leader>K")
