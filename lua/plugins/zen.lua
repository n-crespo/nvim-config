return {
  "folke/snacks.nvim",
  opts = {
    zen = {
      enabled = true,
      backdrop = { transparent = true, blend = 0 },
    },
  },
  keys = {
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
