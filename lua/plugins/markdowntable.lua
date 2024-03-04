-- auto format and align markdown tables
-- SEE ../config/autocmds.lua for autocmds that automate the use of this plugin
return {
  "dhruvasagar/vim-table-mode",
  lazy = true,
  ft = "markdown", -- only load plugin when markdown file opens
  config = function()
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
