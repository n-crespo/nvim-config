vim.cmd([[cab cc CodeCompanion]]) -- works in visual mode too!
return {
  "olimorris/codecompanion.nvim",
  cmd = "CodeCompanion", -- allow the abbreviation :cc to load the plugin
  config = true,
  opts = {
    display = {
      chat = {
        window = {
          opts = {
            number = false,
            statuscolumn = "  ",
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>a",
      desc = "+ai",
      mode = { "n", "v" },
    },
    {
      "<leader>ac",
      function()
        require("codecompanion").chat()
      end,
      desc = "AI Chat",
      mode = { "n", "v" },
    },
    {
      "<leader>aa",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("codecompanion").actions()
      end,
      desc = "AI Actions",
      mode = { "n", "v" },
    },
    {
      "ga",
      function()
        require("codecompanion").add()
      end,
      mode = "v",
      desc = "Add to AI Chat",
    },
  },
}
