return {
  -- use R to run any file! very nice
  -- this overrides the vim native replace mode, which i never use
  "CRAG666/code_runner.nvim",
  event = "BufEnter *.*",
  config = true,
  opts = function()
    vim.keymap.set("n", "R", "<cmd>RunCode<cr>", { desc = "Run Code", silent = true })
    require("code_runner").setup({
      mode = "term",
      startinsert = true,
      filetype = {
        python = "python3 -u",
      },
    })
  end,
}
