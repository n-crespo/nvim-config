return {
  -- auto format and align markdown tables
  "dhruvasagar/vim-table-mode",
  ft = "markdown",
  config = function()
    -- support for markdown table mode (this keymap is unneeded due to the autocmd I created) (see ../lua/config/autocmds.lua)
    -- vim.keymap.set("n", "<leader>mt", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Table Mode [T]oggle" })

    -- these are dumb
    vim.keymap.del("v", "<leader>T")
    vim.keymap.del("v", "<leader>tt")
    vim.keymap.del("n", "<leader>tt")
    vim.keymap.del("n", "<leader>tm")

    -- remove mappings I don't use
    vim.g.table_mode_disable_mappings = 1
    vim.g.table_mode_disable_tableize_mappings = 0
  end,
}
