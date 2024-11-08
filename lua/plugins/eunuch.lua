return {
  "tpope/vim-eunuch",
  event = "VeryLazy",
  keys = {
    {
      "<leader>rm",
      function()
        vim.cmd("Delete")
      end,
    },
  },
}
