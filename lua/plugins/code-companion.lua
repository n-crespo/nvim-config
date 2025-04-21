vim.cmd([[cab cc CodeCompanion]])
return {
  "olimorris/codecompanion.nvim",
  event = "LazyFile",
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
    strategies = {
      chat = {
        keymaps = {
          send = { modes = { n = "<CR>", i = "<CR>" } },
          close = { modes = { n = "q", i = "<C-c>" } },
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
