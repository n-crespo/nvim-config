return {
  "folke/flash.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    search = { multi_window = false },
    label = { uppercase = false },
    jump = {
      nohlsearch = true, -- clear highlight after jump
      autojump = false, -- automatically jump when there is only one match
    },
    modes = {
      -- `f`, `F`, `t`, `T`, `;` and `,` motions
      char = { enabled = false },
      search = { enabled = false },
    },
  },
}
