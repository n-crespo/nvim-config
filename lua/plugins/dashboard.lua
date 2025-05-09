return {
  "folke/snacks.nvim",
  opts = {
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
          {
            icon = " ",
            key = "g",
            -- stylua: ignore
            ---@diagnostic disable-next-line: missing-fields
            action = function() Snacks.lazygit({ cwd = LazyVim.root.git() }) end,
            desc = "LazyGit",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = ([[
          ┌─────┐┌─────┐┌─────┐┌──┐──┐┌──┐┌────────┐
          │  .  ││  .__││  .  ││  │  ││  ││  .  .  │
          └──┘──┘└─────┘└─────┘ '───' └──┘└──┘──┘──┘
        ]]):gsub("^%s+", ""):gsub("\n%s+", "\n")
          .. (vim.env.NVIM_FULL_CONFIG == "true" and "[main]" or "[lite]"),
      },
      sections = {
        { section = "header", padding = 1 },
        { section = "keys", gap = 0, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
