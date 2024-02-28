return {
  "folke/flash.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    -- labels = "abcdefghijklmnopqrstuvwxyz",
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      multi_window = false,
    },
    jump = {
      -- clear highlight after jump
      nohlsearch = true,
      -- automatically jump when there is only one match
      autojump = false,
    },
    label = {
      uppercase = false,
    },
  },
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
