return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    notifier = {
      enabled = true,
    },
    notification = {
      {
        border = "single",
        zindex = 100,
        sort = { "added" },
        ft = "markdown",
        wo = {
          winblend = 5,
          wrap = false,
          conceallevel = 2,
        },
        bo = { filetype = "snacks_notif" },
      },
      history = {
        border = "single",
      },
    },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    terminal = {
      enabled = true,
      win = {
        style = "terminal",
        winbar = "1",
      },
      wo = {
        winbar = "",
      },
      keys = {
        term_normal = {},
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- single border in <leader>m
    Snacks.config.style("notification.history", {
      border = "single",
    })
  end,
  keys = {
    {
      "<leader>m",
      function()
        Snacks.notifier.show_history({ border = "single" })
      end,
      desc = "Message History",
    },
    {
      "<C-q>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
    -- <C-.>, <C-S-/>
  },
}
