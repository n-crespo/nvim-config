return {
  -- auto format and align markdown tables
  -- SEE ../config/autocmds.lua for autocmds that automate the use of this
  -- plugin
  "dhruvasagar/vim-table-mode",
  ft = "markdown",
  config = function()
    -- unneeded due to autocommand
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
