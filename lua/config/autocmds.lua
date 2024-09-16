-- remove all trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function()
      vim.cmd([[%s/\s\+$//e]])
    end)
    vim.fn.setpos(".", save_cursor)
  end,
})

-- always enter normal mode when leaving telescope prompt
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  pattern = { "TelescopePrompt" },
  callback = function()
    vim.api.nvim_exec2("silent! stopinsert!", {})
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})

-- don't conceal my hour log table
vim.api.nvim_create_autocmd({ "BufRead", "FileType" }, {
  pattern = "Mentorship-Hour-Log.md",
  command = "setlocal conceallevel=0 textwidth=0",
})

-- don't use lsp on pvs files
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function(opt)
    if vim.fn.expand("%:e") == "pvs" then
      vim.schedule(function()
        vim.lsp.buf_detach_client(opt.buf, opt.data.client_id)
      end)
    end
  end,
})

-- hacky way to get colored pvs
vim.api.nvim_create_autocmd({ "FileType", "BufRead" }, {
  pattern = { "*.pvs" },
  command = "set ft=c",
})

-- for coldfusion syntax highlighting
vim.api.nvim_create_autocmd({ "FileType", "BufRead" }, {
  pattern = { "*.cf", "*.cfm" },
  command = "set syntax=cf filetype=cf",
})

vim.api.nvim_create_autocmd("OptionSet", {
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
  callback = function()
    if vim.opt.wrap:get() then
      vim.cmd("setlocal tw=0")
    else
      vim.cmd("setlocal tw=80")
    end
  end,
})

-- Create an autogroup for markdown-specific settings
vim.api.nvim_create_augroup("MarkdownConceal", { clear = true })

-- Use ModeChanged to toggle conceallevel based on mode transitions
vim.api.nvim_create_autocmd("ModeChanged", {
  group = "MarkdownConceal",
  pattern = "*:i", -- Entering insert mode
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt_local.conceallevel = 0
    end
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  group = "MarkdownConceal",
  pattern = "i:*", -- Leaving insert mode
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt_local.conceallevel = 2
    end
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  group = "MarkdownConceal",
  pattern = "*:[vV\x16]", -- Entering visual, visual line, or visual block mode
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt_local.conceallevel = 0
    end
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  group = "MarkdownConceal",
  pattern = "[vV\x16]:*", -- Leaving visual, visual line, or visual block mode
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt_local.conceallevel = 2
    end
  end,
})
