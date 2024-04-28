-- sync clipboard with system clipboard automagically without slowing startup
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

vim.api.nvim_create_autocmd({ "BufRead", "FileType" }, {
  pattern = "Mentorship-Hour-Log.md",
  callback = function()
    vim.cmd([[setlocal conceallevel=0]])
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

-- for some reaason the showtabline = 0 in options.lua is overriden somewhere....
vim.api.nvim_create_autocmd("BufEnter", {
  command = "set showtabline=0",
})

-- don't show [Process exited 0] command when terminal is closed
-- (just send a key when that event is heard) AMAZING
vim.api.nvim_create_autocmd("TermClose", {
  command = "call feedkeys('i')",
})

-- remove line numbers and auto enter terminal
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
