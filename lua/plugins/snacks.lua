return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    styles = {
      blame_line = { border = "single" },
      terminal = {
        wo = { winbar = "" },
      },
    },
    quickfile = {
      enabled = true,
    },
    statuscolumn = { enabled = false },
    dashboard = {
      enabled = not vim.g.started_by_firenvim,
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
    notification = {
      border = "single",
      sort = { "added" },
      history = { border = "single" },
    },
    words = {
      enabled = true,
      modes = { "n" },
    },
    animate = { enabled = false, easing = "linear", fps = 120 },
    input = { enabled = true },
    terminal = { enabled = true },
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
    zen = { enabled = true },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- single border in <leader>n
    ---@diagnostic disable-next-line: missing-fields
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
  },
}
