return {
  "willothy/flatten.nvim",
  config = true,
  lazy = false,
  opts = {
    window = {
      open = "alternate",
    },
    callbacks = {
      pre_open = function()
        require("toggleterm").toggle()
      end,
    },
  },
}
