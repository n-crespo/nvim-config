vim.api.nvim_create_autocmd({ "BufWritePre" }, {
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

vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  desc = "Enable cursorline only in active window",
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  desc = "Enable cursorline only in inactive window",
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "FileType" }, {
  desc = "Disable conceal for Mentorship-Hour-Log.md",
  pattern = "Mentorship-Hour-Log.md",
  command = "setlocal conceallevel=0 textwidth=0",
})

vim.api.nvim_create_autocmd({ "FileType", "BufRead" }, {
  desc = "Set pvs filetype",
  pattern = { "*.pvs" },
  command = "set ft=pvs",
})
-- use c highlighting for pvs filetype
vim.treesitter.language.register("c", "pvs")

vim.api.nvim_create_autocmd("OptionSet", {
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

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Enable text width only when wrap is disabled",
  callback = function()
    if vim.opt.wrap:get() then
      vim.cmd("setlocal tw=0")
    else
      vim.cmd("setlocal tw=80")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Cycle quickfix list while inside qf window",
  pattern = "qf",
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "<C-n>", "<cmd>cn<CR>zz<cmd>wincmd p<CR>", opts)
    vim.keymap.set("n", "<C-p>", "<cmd>cN<CR>zz<cmd>wincmd p<CR>", opts)
  end,
})

vim.api.nvim_create_autocmd({ "WinResized" }, {
  desc = "Updates scrolloff on startup and when window is resized",
  group = vim.api.nvim_create_augroup("smart-scrolloff", { clear = true }),
  callback = function()
    local scrolloffPercentage = 0.3
    vim.opt.scrolloff = math.floor(vim.o.lines * scrolloffPercentage)
  end,
})

vim.api.nvim_create_autocmd("WinResized", {
  desc = "Disable wrap when opening split",
  pattern = "*",
  callback = function()
    vim.api.nvim_set_option_value("wrap", false, {
      win = vim.fn.win_getid(vim.fn.winnr("#")),
    })
  end,
})
