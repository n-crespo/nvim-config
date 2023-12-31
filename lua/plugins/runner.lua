return {
  {
    "CRAG666/betterTerm.nvim",
    opts = function()
      ---@diagnostic disable-next-line: missing-fields
      require("betterTerm").setup({
        prefix = "terminal-",
      })
      local betterTerm = require("betterTerm")
      vim.keymap.set({ "n", "t" }, "<C-q>", betterTerm.open, { desc = "Open terminal" })
      -- only ever going to use one of these...
      -- vim.keymap.set({ "n", "t" }, "<C-p>", betterTerm.select, { desc = "Open terminal" })
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    config = true,
    opts = function()
      vim.keymap.set("n", "<leader>r", "<cmd>RunCode<cr>", { desc = "Run Code", silent = true })
      require("code_runner").setup({
        mode = "term",
        startinsert = true,
        filetype = {
          python = "python3 -u",
        },
      })
    end,
  },
}
