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

-- only show cursorline in active window normal moded
autocmd({ "InsertLeave", "WinEnter", "TabEnter", "TermLeave" }, {
  desc = "Enable cursorline only in active window",
  callback = function()
    vim.wo.cursorline = true
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

autocmd({ "FileType", "BufRead" }, {
  desc = "Set pvs filetype",
  pattern = { "*.pvs" },
  command = "set ft=pvs",
})
-- use c highlighting for pvs filetype
vim.treesitter.language.register("c", "pvs")

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
