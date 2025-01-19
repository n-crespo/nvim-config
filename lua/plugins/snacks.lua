vim.g.snacks_animate = false
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    styles = {
      blame_line = { border = "single" },
      terminal = { wo = { winbar = "" } },
      notification_history = { border = "single" },
      notification = { winblend = 100 },
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
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
        header = ([[
          ┌─────┐┌─────┐┌─────┐┌──┐──┐┌──┐┌────────┐
          │  .  ││  .__││  .  ││  │  ││  ││  .  .  │
          └──┘──┘└─────┘└─────┘ '───' └──┘└──┘──┘──┘
        ]]):gsub("^%s+", ""):gsub("\n%s+", "\n"),
      },
      sections = {
        { section = "header", padding = 1 },
        { section = "keys", gap = 1, padding = 1 },
        -- { section = "startup" },
      },
    },
    notification = { sort = { "added" } },
    words = {
      enabled = true,
      modes = { "n" },
    },
    animate = { enabled = false, easing = "linear", fps = 120 },
    input = { enabled = true },
    terminal = {
      enabled = true,
      win = { keys = { nav_l = "<C-l>", nav_j = "<C-j>", nav_k = "<C-k>" } },
    },
    rename = { enabled = true },
    scratch = { enabled = false },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = {
      enabled = true,
      indent = { enabled = true },
      scope = { enabled = true },
      animate = { enabled = false },
    },
    zen = {
      enabled = true,
      toggles = {
        dim = false,
      },
    },
    debug = {
      enabled = false,
    },
    profiler = {
      startup = {
        event = "",
      },
    },
  },
  keys = {
    { "<leader>dph", false, desc = "which_key_ignore", hidden = true },
    { "<leader>dps", false, desc = "which_key_ignore", hidden = true },
    { "<leader>dpp", false, desc = "which_key_ignore", hidden = true },
    {
      "<C-q>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
    {
      "<C-S-/>",
      function()
        Snacks.terminal.toggle("fish", {
          win = {
            position = "float",
            height = 0.8,
            width = 0.8,
            border = "single",
          },
          -- cwd = vim.loop.cwd(),
        })
      end,
      desc = "Toggle Floating Terminal",
      mode = { "n", "t" },
    },
    {
      "<C-S-Q>",
      function()
        Snacks.terminal.toggle("fish", {
          win = {
            relative = "editor",
            position = "float",
            height = 0.8,
            width = 0.8,
            border = "single",
          },
          -- cwd = vim.loop.cwd(),
        })
      end,
      desc = "Toggle Floating Terminal",
      mode = { "n", "t" },
    },
    -- <C-.>, <C-S-/>
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>A",
      function()
        Snacks.dashboard.open()
      end,
      desc = "Open Dashboard",
    },
  },
}
