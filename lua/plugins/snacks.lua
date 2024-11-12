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
        term_normal = {
          "<esc>",
          "<esc",
          mode = "t",
          expr = true,
          desc = "Double escape to normal mode",
        },
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    Snacks.config.style("notification.history", {
      border = "single",
    })
    vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
      pattern = "snacks_terminal",
      -- once = true,
      callback = function()
        -- vim.cmd([[tmap <esc> <esc>]])
        vim.keymap.set("t", "<esc>", function()
          vim.cmd([[echo "hello"]])
        end, { buffer = true, desc = "normal escape" })
      end,
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
