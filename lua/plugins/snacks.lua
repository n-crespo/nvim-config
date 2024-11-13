return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    notifier = {
      enabled = true,
      style = "fancy",
    },
    notification = {
      {
        border = "single",
        zindex = 100,
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
  },
}
