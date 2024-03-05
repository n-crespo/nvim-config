-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = { "*" },
  command = [[call setreg("@", getreg("+"))]],
})
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  command = [[call setreg("+", getreg("@"))]],
})

-- never wrap my code. Please. Stop it.
vim.api.nvim_create_autocmd({ "BufRead" }, {
  callback = function()
    vim.cmd([[set nowrap]])
  end,
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
  callback = function()
    vim.cmd([[set ft=c]])
  end,
})

-- make :W the same as :w
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })

-- make :E the same as :e
vim.api.nvim_create_user_command("E", "e", { nargs = 0 })

-- don't show [Process exited 0] command when terminal is closed
-- (just send a key when that event is heard) AMAZING
vim.api.nvim_create_autocmd({ "FileType", "TermClose" }, {
  -- default name of better_term terminal is "Term_1"
  pattern = { "Term_1" }, -- this only works because i only ever have one terminal
  callback = function()
    vim.cmd([[call feedkeys('i')]])
  end,
})

-- always enter normal mode when leaving telescope prompt
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  pattern = { "TelescopePrompt" },
  callback = function(event)
    vim.api.nvim_exec2("silent! stopinsert!", {})
  end,
})

-- disable mini-indent scope in terminal and documentation hover
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "better_term", "noice" },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

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

-- i don't think this works
vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter", "BufEnter" }, {
  pattern = { "noice" },
  callback = function()
    vim.cmd([[
    setlocal scrolloff=8
    set nowrap
    ]])
  end,
})
