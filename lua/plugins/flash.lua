return {
  "folke/flash.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    search = {
      multi_window = false,
    },
    jump = {
      nohlsearch = true, -- clear highlight after jump
      autojump = false, -- automatically jump when there is only one match
    },
    label = {
      uppercase = false,
    },
    modes = {
      char = { -- `f`, `F`, `t`, `T`, `;` and `,` motions
        enabled = false,
      },
      search = {
        enabled = false,
      },
    },
  },
  keys = {
    -- {
    --   mode = { "n", "x", "o" },
    --   "S", -- used for ts-actions
    --   false,
    -- },
  },
}
