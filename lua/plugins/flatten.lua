return {
  "willothy/flatten.nvim",
  config = true,
  lazy = false,
  opts = {
    window = {
      open = "alternate",
    },
    callbacks = {
      post_open = function()
        -- require("toggleterm").toggle_all()
      end,
    },
  },
}
