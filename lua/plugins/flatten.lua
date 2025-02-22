return {
  "willothy/flatten.nvim",
  lazy = false,
  config = true,
  opts = {
    window = { open = "tab" },
    hooks = {
      post_open = function()
        require("snacks").terminal.toggle()
        vim.cmd([[silent! windo only]])
      end,
    },
  },
}
