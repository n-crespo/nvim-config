return {
  "folke/persistence.nvim",
  cond = not LazyVim.is_win(),
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
  },
}
