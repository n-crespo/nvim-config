return {

  {
    "CRAG666/betterTerm.nvim",
    opts = function()
      local betterTerm = require("betterTerm")
      vim.keymap.set({ "n", "t" }, "<C-;>", betterTerm.open, { desc = "Open terminal" })
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    config = true,
    opts = function()
      vim.keymap.set("n", "<leader>r", "<cmd>RunCode<cr>", { desc = "Run Code", silent = true })
      require("code_runner").setup({
        mode = "better_term",
        startinsert = true,
        filetype = {
          python = "python3 -u",
        },
      })
    end,
  },
}
