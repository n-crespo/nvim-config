-- when exiting telescope, always be in normal mode
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  callback = function(event)
    if vim.bo[event.buf].filetype == "telescopeprompt" then
      vim.api.nvim_exec2("silent! stopinsert!", {})
    end
  end,
})

-- auto toggle table mode when opening and closing markdown file
vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile" }, {
  pattern = { "markdown" },
  callback = function()
    vim.cmd([[silent! TableModeToggle]])
    vim.cmd([[set nowrap]])
  end,
})

vim.api.nvim_create_autocmd(
  { "FileType", "BufRead", "BufEnter", "BufNewFile", "BufAdd", "BufFilePost", "BufFilePre" },
  {
    pattern = { "rmarkdown" },
    callback = function()
      vim.cmd([[set ft=rmd]])
      -- print("filetype set to rmd")
    end,
  }
)

-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = { "*" },
  command = [[call setreg("@", getreg("+"))]],
})

-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  command = [[call setreg("+", getreg("@"))]],
})

vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
    " au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
    " au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>Telescope file_browser<CR>
  augroup END
]])
