return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    styles = { blame_line = { border = "single" } },
    dashboard = {
      width = 45,
      preset = {
        keys = {
          { icon = " ", key = "e", desc = "Explore", action = "<leader>e" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "o", desc = "Old Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
 ┌─────┐┌─────┐┌─────┐┌──┐──┐┌──┐┌────────┐
 │  .  ││  .__││  .  ││  │  ││  ││  .  .  │
 └──┘──┘└─────┘└─────┘ '───' └──┘└──┘──┘──┘
        ]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        -- { section = "startup" },
      },
    },
    notification = {
      border = "single",
      sort = { "added" },
      history = { border = "single" },
    },
    words = { enabled = false },
    terminal = {
      enabled = true,
      win = {
        style = "terminal",
        winbar = "1",
      },
      wo = { winbar = "" },
    },
    rename = {
      enabled = true,
    },
    scratch = {
      enabled = true,
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
