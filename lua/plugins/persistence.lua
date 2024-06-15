return {
  "folke/persistence.nvim",
  opts = {
    pre_save = function()
      vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
    end,
  },
  keys = {
    { "<leader>qs", false },
    { "<leader>ql", false },
    { "<leader>qd", false },
    { "<leader>q", "<C-W>c" },
  },
}
