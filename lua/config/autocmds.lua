-- never wrap my code. Please. Stop it.
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    vim.cmd([[set nowrap]])
  end,
})

-- don't conceal my hour log table
vim.api.nvim_create_autocmd({ "BufRead", "FileType" }, {
  pattern = "Mentorship-Hour-Log.md",
  callback = function()
    vim.cmd([[setlocal conceallevel=0]])
    vim.cmd([[setlocal textwidth=0]])
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.b.miniindentscope_disable = true
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

-- make :Q the same as :qa
vim.api.nvim_create_user_command("Q", "qa", { nargs = 0 })

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

-- remove line numbers and auto enter terminal on TermOpen
vim.cmd([[
" Terminal Buffer
function! TerminalSettings()
  setlocal nonumber
  setlocal norelativenumber
  normal a
endfunction
augroup terminal
  autocmd!
  autocmd TermOpen * call TerminalSettings()
augroup END
]])

-- always enter normal mode when leaving telescope prompt
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  pattern = { "TelescopePrompt" },
  callback = function()
    vim.api.nvim_exec2("silent! stopinsert!", {})
  end,
})

-- don't center motions in mini.files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "minifiles" },
  callback = function()
    vim.keymap.set("n", "G", "G", { buffer = true })
    vim.keymap.set("n", "<C-d>", "<C-d>", { buffer = true })
    vim.keymap.set("n", "<C-u>", "<C-u>", { buffer = true })
  end,
})
