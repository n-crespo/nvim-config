return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    styles = { blame_line = { border = "single" } },
    quickfile = {
      enabled = true,
    },
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
          { icon = " ", key = "p", desc = "Pick Session", action = ':lua require("persistence").select()' },
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
    words = {
      enabled = true,
      modes = {},
      notify_jump = true,
      notify_end = true,
    },
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
