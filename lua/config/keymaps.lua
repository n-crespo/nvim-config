-- --------------------------------------- CENTERING MOTIONS ---------------------------------------
--
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { noremap = true, desc = "Go Down" })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { noremap = true, desc = "Go Up" })
-- vim.keymap.set("n", "}", "}zz", { noremap = true })
-- vim.keymap.set("n", "{", "{zz", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true, desc = "End of File" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, desc = "Prev Search Result" })
vim.keymap.set("n", "<BS>", "<C-o>zz", { desc = "Prev Jumplist", silent = true })

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
vim.keymap.set("v", "<leader>d", "ygvd", { desc = "Delete to Paste Register", silent = true })
vim.keymap.set("n", "<leader>d", "yydd", { desc = "Delete to Paste Register", silent = true })

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

-- --------------------------------------- WINDOWS AND BUFFERS -------------------------------------

-- delete all other {something} (tab, buffer, window)
vim.keymap.set("n", "<leader>wo", "<cmd>only <CR>", { silent = true, desc = "Window only" })
vim.keymap.set("n", "<leader>bo", "<cmd>w | %bd | e# | bd#<cr>", { desc = "Buffer Only", silent = true })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close all other tabs", silent = true })

-- needed because I override <C-w>
vim.keymap.set("n", "<leader>wr", "<C-w>r", { silent = true, desc = "Window rotate" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Other Window", silent = true })

-- cd to current buffer (replace autochdir)
vim.keymap.set("n", "<leader>bl", "<cmd>cd %:h<cr>", { desc = "Buffer Locate", silent = true })

-- close buffer (soft) (preserve split)
vim.keymap.set("n", "<leader>k", "<leader>bd", { remap = true, silent = true, desc = "Close Buffer" })

-- close buffer (not soft) (don't preserve split)
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>", { desc = "Quit Buffer", silent = true })

-- splits
vim.keymap.set("n", "<leader>\\", "<leader>|", { remap = true, silent = true, desc = "Vertical Split" })
-- vim.keymap.set("n", "\\", "<cmd>vsplit<cr>", { remap = true, silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { remap = true, silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "_", "<cmd>split<cr>", { remap = true, silent = true, desc = "Vertical Split" })

-- window resizing (<C-up> and <C-down> are used by multicursor)
vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })

-- --------------------------------------- KEYMAP DELETIONGS ---------------------------------------
-- unneeded LazyVim keymaps
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>K")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>sb")
vim.keymap.del("n", "<leader>fb")
vim.keymap.del("n", "<leader>fg")
vim.keymap.del("n", "<leader>fr")
vim.keymap.del("n", "<leader>fR")
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("n", "<leader>qÞ")
vim.keymap.del("n", "<leader>sg")
vim.keymap.del("n", "<leader>sC")
-- vim.keymap.del("n", "<leader><Tab>")
vim.keymap.del("n", "<leader><Tab><Tab>")
vim.keymap.del("n", "<leader><Tab>[")
vim.keymap.del("n", "<leader><Tab>]")
vim.keymap.del("n", "<leader><Tab>d")
vim.keymap.del("n", "<leader><Tab>f")
vim.keymap.del("n", "<leader><Tab>l")
vim.keymap.del("n", "<leader>bD")

vim.keymap.del("n", "<C-w>Þ") -- to remove whichkey delay

-- media control buttons (don't send keypresses)
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- volume up
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- volume down
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- mute
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- mute
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- prev
vim.keymap.set({ "i", "n" }, "", "<Nop>") -- skip

-- --------------------------------- OS SPECIFIC KEYMAPS -------------------------------------------

-- these are used because LWin+j, k, h, and l are mapped to the arrow keys and
-- LWin+u and d are mapped to page up and page down (via autohotkey)
if vim.fn.has("wsl") or vim.fn.has("win32") then
  vim.keymap.set("n", "<leader>os", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })
  vim.keymap.set({ "n", "v" }, "<Up>", "<M-k>", { remap = true, silent = true })
  vim.keymap.set({ "n", "v" }, "<Down>", "<M-j>", { remap = true, silent = true })
  vim.keymap.set("n", "<PageUp>", "<C-u>zz", { silent = true })
  vim.keymap.set("n", "<PageDown>", "<C-d>zz", { silent = true })
elseif vim.fn.has("mac") then
  -- vim.notify("Keymaps not set, MacOS detected")
  vim.keymap.set("n", "<leader>os", "<cmd>!open %<cr>", { silent = true, desc = "Open in System Viewer" })
end

-- --------------------------------- TAB RELATED STUFF --------------------------------------------
-- toggle tabline
-- vim.keymap.set("n", "<leader>a", function()
--   local current_value = vim.o.showtabline
--   local new_value = (current_value == 0) and 2 or 0
--   vim.cmd("set showtabline=" .. new_value)
-- end, { silent = true, desc = "Toggle Tabline" })

-- true tab navigation
vim.keymap.set("n", "<S-L>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<S-H>", "<cmd>tabprev<cr>")
vim.keymap.set("n", "<C-Tab>", "<cmd>tabnext<cr>", { silent = true, desc = "Next Tab" })
vim.keymap.set("n", "<C-S-Tab>", "<cmd>tabprev<cr>", { silent = true, desc = "Previous Tab" })

vim.keymap.set("n", "<C-space>", "<cmd>tabnew<cr>")
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

-- --------------------------------- PERMANENT HIGHLIGHTING -------------------------------------

local function getVisualSelectionRange()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local i = math.min(start_line, end_line)
  local j = math.max(start_line, end_line)
  local selection = "["
  while i < j do
    selection = selection .. i .. ", "
    i = i + 1
  end
  selection = selection .. j .. "]"
  return selection
end

function DoFunnyHighlight(highlight)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  local selection = getVisualSelectionRange()
  if highlight ~= nil then
    vim.cmd("call matchaddpos('" .. highlight .. "'," .. selection .. ")")
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end

-- bug: the below `< and `> only update when exiting visual mode. this is why
-- the doFunnyHighlight must be called exists and must be called twice
vim.keymap.set(
  "v",
  "<leader>h",
  "<cmd>lua DoFunnyHighlight()<cr><esc>v<cmd>lua DoFunnyHighlight('LineHighlight')<cr>",
  { desc = "Highlight selection", silent = true }
)

vim.keymap.set(
  "n",
  "<leader>h",
  ":call matchadd('LineHighlight', '\\%'.line('.').'l')<cr>",
  { desc = "Highlight current line", silent = true }
)

vim.keymap.set("n", "<leader>H", ":call clearmatches()<cr>", { desc = "Clear line highlight", silent = true })

-- --------------------------------- PLUGIN SPECIFIC KEYMAPS ---------------------------------------

-- zb but respect scrollEOF plugin
vim.keymap.set("n", "zb", "zbkj", { silent = true, desc = "Bottom line" })

-- git blame
vim.keymap.set("n", "gb", "<leader>ghb", { remap = true, silent = true, desc = "Blame Line" })
vim.keymap.set("n", "gp", "<leader>ghp", { remap = true, silent = true, desc = "Blame Line" })

-- unholy non-native vim keymap for find in buffer
vim.keymap.set("n", "<C-f>", function()
  require("telescope.builtin").current_buffer_fuzzy_find(
    require("telescope.themes").get_dropdown({ winblend = 0, previewer = false })
  )
end, { desc = "Find Word" })

-- ------------------------------------- PERMISSIONS -----------------------------------------------

-- Force save as sudo (for readonly files)
vim.keymap.set("n", "<leader>W", "<cmd>w !sudo tee %<cr>", { desc = "Force Save", noremap = true, silent = true })

-- grant permissions
vim.keymap.set("n", "<leader>X", "<Cmd>!sudo chmod +x %<CR>", { silent = true, desc = "Permissions" })

-- ------------------------------------- MISC KEYMAPS ----------------------------------------------

-- don't let cursor fly around when using J
vim.keymap.set("n", "J", "mzJ`z<cmd>delm z<CR>", { silent = true, desc = "better J" })

-- apply macro over selected region
vim.keymap.set("x", "Q", ":norm @q<cr>", { desc = "Play Q Macro", silent = true })

-- clear terminal (overriding <C-l> for window navigation)
vim.keymap.set("t", "<C-l>", "<C-l>", { noremap = true })

-- restore original terminal keymap behavior
vim.keymap.set("t", "<C-k>", "<C-k>", { noremap = true })
vim.keymap.set("t", "<C-j>", "<C-j>", { noremap = true })

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
vim.keymap.set({ "n", "v" }, "<C-;>", ":")

-- increment and decrement with plus and minus (since I override <C-a>)
vim.keymap.set({ "n", "v" }, "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "-", "<C-x>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

-- full line navigation (i never use E and B)
vim.keymap.set({ "n", "v" }, "E", "$", { desc = "End of line", silent = true })
vim.keymap.set({ "n", "v" }, "B", "_", { desc = "Start of line", silent = true })

-- follow links better
vim.keymap.set("n", "gx", "<cmd>sil !open <cWORD><cr>", { silent = true, desc = "Follow Link" })

vim.keymap.set("n", "`", "za", { desc = "Toggle fold" }) -- i don't use marks
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "Undo" })
vim.keymap.set("i", "<C-Del>", "<C-o>de") -- traditional functionality of <C-delete>
vim.keymap.set("n", "gp", "<leader>ghp>", { remap = true, desc = "Git Preview" })
vim.keymap.set("s", "<BS>", "<C-O>s")

vim.keymap.set("n", "<leader>T", "<cmd>vsp | term<cr>", { desc = "Terminal Split" })
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", { desc = "Redo" })

vim.keymap.set("n", "<C-S-?>", ":normal gcc<CR><DOWN>", { desc = "[/] Toggle comment line", silent = true })
vim.keymap.set("v", "<C-S-?>", ":normal gcc<CR>gv", { desc = "[/] Toggle comment line", silent = true })

vim.keymap.set("n", "<ScrollWheelUp>", "2<C-y>")
vim.keymap.set("n", "<ScrollWheelDown>", "2<C-e>")
vim.keymap.set("i", "<ScrollWheelUp>", "2<C-y>")
vim.keymap.set("i", "<ScrollWheelDown>", "2<C-e>")
vim.keymap.set("v", "<ScrollWheelUp>", "2<C-y>")
vim.keymap.set("v", "<ScrollWheelDown>", "2<C-e>")
