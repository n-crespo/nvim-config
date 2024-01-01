return {
  -- use <leader>r to run any file! very nice
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
}
