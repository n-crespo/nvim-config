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
  end,
})

vim.api.nvim_create_autocmd(
  { "FileType", "BufRead", "BufEnter", "BufNewFile", "BufAdd", "BufFilePost", "BufFilePre" },
  {
    pattern = { "*.Rmd" },
    callback = function()
      vim.cmd([[set ft=rmd]])
    end,
  }
)

-- HACK: auto color pvs files like java files
vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile", "BufAdd", "BufFilePost", "BufFilePre" }, {
  pattern = { "*.pvs" },
  callback = function()
    vim.cmd([[set ft=java]])
  end,
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

-- make :W the same as :w
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })

-- make :Q the same as :q
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })
