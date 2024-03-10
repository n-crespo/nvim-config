-- center big motions
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Go Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Go Up" })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { noremap = true, desc = "Next Jumplist" })
-- vim.keymap.set("n", "<C-o>", "<C-o>zz", { noremap = true, desc = "Prev Jumplist" })
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
-- vim.keymap.set("n", "<C-p>", "<cmd>Telescope buffers<cr>", { remap = true, desc = "Pick Buffer" })
-- vim.keymap.set("n", "<C-n>", "<cmd>vnew<cr>", { desc = "New Buffer" })

-- full line navigation
vim.keymap.set("n", "E", "g_", { desc = "End of line", silent = true })
vim.keymap.set("v", "E", "g_", { desc = "End of line", silent = true })
vim.keymap.set("n", "B", "_", { desc = "Start of line", silent = true })
vim.keymap.set("v", "B", "_", { desc = "Start of line", silent = true })

-- unneeded
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>K")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>sb")
-- vim.keymap.del("n", "<leader>lÞ")
-- vim.keymap.del("x", "<leader>lÞ")

-- these are used because LWin+j, k, h, and l are mapped to the arrow keys and
-- LWin+u and d are mapped to page up and page down (via autohotkey)
vim.keymap.set("n", "<Up>", "<M-k>", { remap = true, silent = true })
vim.keymap.set("v", "<Up>", "<M-k>", { remap = true, silent = true })
vim.keymap.set("n", "<Down>", "<M-j>", { remap = true, silent = true })
vim.keymap.set("v", "<Down>", "<M-j>", { remap = true, silent = true })
vim.keymap.set("n", "<PageUp>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "<PageDown>", "<C-d>zz", { silent = true })

-- cd to current buffer (replace autochdir)
vim.keymap.set("n", "<leader>bl", "<cmd>cd %:h<cr>", { desc = "Buffer Locate", silent = true })
vim.keymap.set("n", "<leader>k", "<leader>bd", { remap = true, silent = true, desc = "Close Buffer" })
vim.keymap.set("n", "<leader>K", "<cmd>tabclose<cr>", { remap = true, silent = true, desc = "Close Tab" })

-- navigate and list tabs
vim.keymap.set("n", "<leader>a", function()
  vim.cmd("tabs")
end, { silent = true, desc = "List Tabs" })
vim.keymap.set("n", "<leader>1", "<leader>un1gt", { remap = true, silent = true, desc = "Goto Tab 1" })
vim.keymap.set("n", "<leader>2", "<leader>un2gt", { remap = true, silent = true, desc = "Goto Tab 2" })
vim.keymap.set("n", "<leader>3", "<leader>un3gt", { remap = true, silent = true, desc = "Goto Tab 3" })
vim.keymap.set("n", "<leader>4", "<leader>un4gt", { remap = true, silent = true, desc = "Goto Tab 4" })
vim.keymap.set("n", "<leader>5", "<leader>un5gt", { remap = true, silent = true, desc = "Goto Tab 5" })

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
-- vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Auto Correct", silent = true })
-- <C-l> to accept top cmp suggestion
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-h>", "<Left>")

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
vim.keymap.set({ "i", "c" }, "<C-v>", "<C-r>+", { noremap = true, silent = true, desc = "Paste from clipboard" })

vim.keymap.set({ "n", "t", "v" }, "<C-x>", "<cmd>tabnext<cr>") -- mapped to <C-Tab> through alacritty
vim.keymap.set({ "n", "t", "v" }, "<C-p>", "<cmd>tabprev<cr>") -- mapped to <C-S-Tab> through alacritty

vim.keymap.set("n", "<S-L>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<S-H>", "<cmd>tabprev<cr>")

vim.keymap.set("n", "<C-n>", "<Cmd>tabnew<cr>")
vim.keymap.del("n", "<C-w>Þ") -- to remove delay

vim.keymap.set("n", "<C-w>", function()
  local success, result = pcall(function()
    vim.cmd("tabclose")
  end)
  if not success then
    vim.cmd("qa")
  end
end)

vim.keymap.set("n", "<S-w>", "<cmd>tabclose<cr>")
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<cr>")
vim.keymap.set("n", "t", "<cmd>tabnew<cr>")

vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close all other tabs", silent = true })
vim.keymap.set("i", "<C-j>", "<C-n>")

vim.keymap.set("n", "<leader>wl", "<cmd>windo wincmd L<cr>", { desc = "Send to Vertical Split" })
