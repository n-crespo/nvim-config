return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xL", nil },
    { "<leader>xl", nil },
    { "<leader>xt", nil },
    { "<leader>xT", nil },
    { "<leader>xq", nil },
    { "<leader>xQ", nil },
    { "<leader>cS", nil },
    {
      "<S-CR>",
      "o",
      desc = "Select and Close",
      remap = true,
      ft = "trouble",
      buffer = true,
    },
  },
}
