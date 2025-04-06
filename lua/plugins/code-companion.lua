vim.cmd([[cab cc CodeCompanion]])
return {
  "olimorris/codecompanion.nvim",
  event = "LazyFile",
  config = true,
  opts = {
    display = {
      chat = {
        auto_scroll = false,
        show_settings = true,
        window = { opts = { number = false } },
      },
    },
    strategies = {
      chat = {
        keymaps = {
          send = { modes = { n = "<CR>", i = "<C-CR>" } },
          close = { modes = { n = "q", i = "<C-c>" } },
        },
      },
    },
  },
  keys = {
    {
      "<leader>a",
      desc = "+ai",
    },
    {
      "<leader>ac",
      function()
        require("codecompanion").chat()
      end,
      desc = "AI Chat",
    },
    {
      "<leader>aa",
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require("codecompanion").actions()
      end,
      desc = "AI Actions",
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
