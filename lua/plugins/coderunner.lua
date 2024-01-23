return {
  -- use R to run any file! very nice
  -- this overrides the vim native replace mode, which i never use
  "CRAG666/code_runner.nvim",
  event = "LazyFile",
  config = true,
  opts = {
    mode = "float",
    startinsert = true,
    filetype = {
      python = "python3 -u",
    },
    term = {
      position = "bot", -- horiz, top, vert
      size = 18,
    },
    float = {
      border = "rounded",
      close_key = "<ESC>",
      blend = 10,
    },
  },
  keys = {
    { "RK", "<cmd>RunFile float<cr>", desc = "Run Code" },
    { "RJ", "<cmd>RunFile term<cr>", desc = "Run Code" },
  },
  config = function(_, opts)
    require("code_runner").setup(opts)
  end,
}
