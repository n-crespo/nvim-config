return {
  "folke/persistence.nvim",
  enabled = not LazyVim.is_win(),
  opts = {
    pre_save = function()
      vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
    end,
  },
  keys = {
    { "<leader>qs", false },
    { "<leader>ql", false },
    { "<leader>qd", false },
    { "<leader>qS", false },
    { "<leader>q", "<C-W>c", { desc = "Close Window" } },
  },
}
