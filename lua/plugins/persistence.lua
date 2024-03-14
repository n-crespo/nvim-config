return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", nil},
      { "<leader>ql", nil},
      { "<leader>qd", nil},
    },
}
