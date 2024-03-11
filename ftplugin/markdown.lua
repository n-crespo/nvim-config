vim.keymap.set("i", "<S-Tab>", "<C-d>", { buffer = true, silent = true })
vim.keymap.set("i", "*", "**<left>", { buffer = true, silent = true })
vim.keymap.set("i", "$$", "$$$$<left><left>", { buffer = true, silent = true })
vim.keymap.set("i", "_", "__<left>", { buffer = true, silent = true })
vim.keymap.set("i", "<C-e>", "```<cr><cr>```<up><up>", { buffer = true, silent = true })
vim.cmd([[ setlocal commentstring=<!--\ %s\ --> ]])

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.md" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    pcall(function()
      vim.cmd([[TableModeRealign]])
    end)
    vim.fn.setpos(".", save_cursor)
  end,
})
