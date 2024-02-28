return {
  "folke/flash.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    { "S", nil }, -- tsactions
  },
}
