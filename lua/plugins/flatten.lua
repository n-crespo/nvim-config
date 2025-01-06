return {
  "willothy/flatten.nvim",
  enabled = true,
  commit = "7605dec",
  config = true,
  lazy = false,
  opts = {
    window = {
      open = "alternate",
    },
    callbacks = {
      pre_open = function()
        require("snacks").terminal.toggle()
      end,
    },
  },
}
