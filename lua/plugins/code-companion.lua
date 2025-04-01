vim.cmd([[cab cc CodeCompanion]])
return {
  "olimorris/codecompanion.nvim",
  event = "LazyFile",
  config = true,
  keys = {
    {
      "<leader>ac",
      function()
        require("codecompanion").chat()
      end,
    },
    {
      "<leader>aa",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("codecompanion").actions()
      end,
    },
    {
      "ga",
      function()
        require("codecompanion").add()
      end,
      mode = "v",
    },
  },
}
