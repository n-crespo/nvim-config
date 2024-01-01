return {
  -- auto format and align markdown tables
  "dhruvasagar/vim-table-mode",
  config = function()
    -- support for markdown table mode
    vim.keymap.set("n", "<leader>mt", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Table Mode [T]oggle" })
    -- these are dumb
    vim.keymap.del("v", "<leader>T")
    vim.keymap.del("v", "<leader>tt")
    vim.keymap.del("n", "<leader>tt")
    vim.keymap.del("n", "<leader>tm")
  end,
}
