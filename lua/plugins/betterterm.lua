-- use <c-q> to easily toggle a terminal (better than :term)
-- kinda like vscode... (shame)
return {
  "CRAG666/betterTerm.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<C-q>",
      function()
        require("betterTerm").open()
      end,
      mode = { "n", "t" },
    },
    {
      "<C-o>",
      function()
        require("betterTerm").open()
        vim.cmd([[call feedkeys("\<C-o>")]])
      end,
      mode = "n",
    },
  },
}
