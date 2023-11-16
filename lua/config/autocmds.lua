vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  callback = function(event)
    if vim.bo[event.buf].filetype == "telescopeprompt" then
      vim.api.nvim_exec2("silent! stopinsert!", {})
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function(event)
    if vim.bo[event.buf].filetype == "markdown" then
      vim.api.nvim_command("TableModeEnable")
    end
  end,
})
