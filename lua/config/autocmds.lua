local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
  desc = "Remove all trailing whitespace on save",
  pattern = { "*" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function()
      vim.cmd([[%s/\s\+$//e]])
    end)
    vim.fn.setpos(".", save_cursor)
  end,
})

-- only show cursorline in active window normal mode
autocmd({ "InsertLeave", "WinEnter", "TabEnter", "TermLeave" }, {
  desc = "Enable cursorline only in active window",
  callback = function()
    vim.wo.cursorline = vim.bo.filetype ~= "snacks_dashboard"
      and vim.bo.filetype ~= "snacks_terminal"
      and vim.bo.filetype ~= "snacks_picker_input"
      and vim.bo.filetype ~= "dap-repl"
  end,
})

autocmd({ "InsertEnter", "WinLeave", "TabLeave" }, {
  desc = "Enable cursorline only in active window",
  callback = function()
    vim.wo.cursorline = false
  end,
})

autocmd({ "BufRead", "FileType" }, {
  desc = "Disable conceal for Mentorship-Hour-Log.md",
  pattern = "Mentorship-Hour-Log.md",
  command = "setlocal conceallevel=0",
})

-- use c highlighting for pvs filetype
vim.treesitter.language.register("c", "pvs")
vim.filetype.add({
  pattern = {
    [".*%.pvs"] = "pvs",
  },
})

autocmd({ "OptionSet", "BufEnter" }, {
  desc = "Enable text width only when wrap is disabled",
  pattern = "wrap",
  callback = function()
    if vim.opt.wrap:get() then
      vim.cmd("setlocal tw=0")
    else
      vim.cmd("setlocal tw=80")
    end
  end,
})

autocmd("FileType", {
  desc = "Cycle quickfix list while inside qf window",
  pattern = "qf",
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "<C-n>", "<cmd>cn<CR>zz<cmd>wincmd p<CR>", opts)
    vim.keymap.set("n", "<C-p>", "<cmd>cN<CR>zz<cmd>wincmd p<CR>", opts)
  end,
})

autocmd("TextYankPost", {
  desc = "Sync pasting with local clipboard while ssh-ed",
  callback = function()
    vim.highlight.on_yank()
    local copy_to_unnamedplus = require("vim.ui.clipboard.osc52").copy("+")
    copy_to_unnamedplus(vim.v.event.regcontents)
    local copy_to_unnamed = require("vim.ui.clipboard.osc52").copy("*")
    copy_to_unnamed(vim.v.event.regcontents)
  end,
})

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "image" },
--   desc = "Prompt to open images",
--   callback = function()
-- local filename = vim.api.nvim_buf_get_name(0)
-- vim.defer_fn(function()
--   vim.ui.select({ "yes", "no" }, { -- Simplified options
--     prompt = "This file seems to be an image. Open it in the system viewer?",
--   }, function(choice)
--     if choice == "yes" then -- Choice will now be the index (1 or 2)
--       vim.ui.open(filename)
--     end
--   end)
-- end, 0) -- Timeout of 0 milliseconds
--   end,
-- })
