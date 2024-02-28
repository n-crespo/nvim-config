-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = { "*" },
  command = [[call setreg("@", getreg("+"))]],
})
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  command = [[call setreg("+", getreg("@"))]],
})

-- auto toggle table mode when opening and closing markdown file
vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  callback = function()
    vim.cmd([[setlocal nowrap]])
    vim.keymap.set(
      "n",
      "<C-s>",
      "<cmd>TableModeRealign<cr><cmd>w<cr>",
      { desc = "Save and Format File", buffer = true, silent = true }
    )
    vim.keymap.set("i", "<S-Tab>", "<C-d>", { buffer = true, silent = true })
    vim.keymap.set("i", "*", "**<left>", { buffer = true, silent = true })
  end,
})

-- fix rmarkdown filetype (use rmd)
vim.api.nvim_create_autocmd({ "FileType", "BufRead" }, {
  pattern = { "*.Rmd" },
  callback = function()
    vim.cmd([[set ft=rmd]])
  end,
})

-- enable inlay hints for cpp files
vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufEnter" }, {
  pattern = { "*.cpp" },
  callback = function()
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
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

-- make :Q the same as :q
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })

-- dont show [Process exited 0] command when terminal is closed
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
