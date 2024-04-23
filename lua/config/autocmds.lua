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

-- Close Code Runner buffers with 'q'
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "crunner_*" },
  callback = function(event)
    vim.cmd([[echo 'crunner detected']])
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- make :W the same as :w
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })

-- make :E the same as :e
vim.api.nvim_create_user_command("E", "e", { nargs = 0 })

-- make :Q the same as :qa
vim.api.nvim_create_user_command("Q", "qa", { nargs = 0 })

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
  callback = function()
    vim.api.nvim_exec2("silent! stopinsert!", {})
  end,
})

-- disable mini-indent scope in terminal and documentation hover
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "better_term", "noice", "man" },
  callback = function()
    ---@diagnostic disable-next-line: inject-field
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

-- don't center motions in mini.files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "minifiles" },
  callback = function()
    vim.keymap.set("n", "G", "G", { buffer = true })
    vim.keymap.set("n", "<C-d>", "<C-d>", { buffer = true })
    vim.keymap.set("n", "<C-u>", "<C-u>", { buffer = true })
  end,
})

vim.api.nvim_create_augroup("cmdwin_treesitter", { clear = true })
vim.api.nvim_create_autocmd("CmdwinEnter", {
  pattern = "*",
  command = "TSBufDisable incremental_selection",
  group = "cmdwin_treesitter",
  desc = "Disable treesitter's incremental selection in Command-line window",
})

-- for some reaason the showtabline = 0 in options.lua is overriden somewhere....
vim.api.nvim_create_autocmd("BufEnter", {
  command = "set showtabline=0",
})

-- don't center motions in mini.files
vim.api.nvim_create_autocmd({ "FileType", "BufRead" }, {
  pattern = { "markdown" },
  callback = function()
    vim.cmd([[setlocal syn=markdown]])
  end,
})
