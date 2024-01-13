-- when exiting telescope, always be in normal mode
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  callback = function(event)
    if vim.bo[event.buf].filetype == "telescopeprompt" then
      vim.api.nvim_exec2("silent! stopinsert!", {})
    end
  end,
})

-- set conceallevel to 3 on Rmd files, overriding some plugin (see
-- lua/plugins/rmarkdown.lua)
-- vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
--   pattern = { "*.Rmd" },
--   callback = function()
--     vim.opt_local.conceallevel = 3
--   end,
-- })

-- -- fix rmd filetype for lsp functionality
-- vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
--   pattern = { "*.Rmd" },
--   command = [[set ft=rmd]],
-- })

-- auto toggle table mode when opening and closing markdown file
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufLeave" }, {
  pattern = { "*.md" },
  command = [[silent! TableModeToggle]],
})

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
