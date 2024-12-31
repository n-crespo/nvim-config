return {
  "willothy/flatten.nvim",
  enabled = false,
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
