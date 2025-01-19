return {
  "willothy/flatten.nvim",
  enabled = true,
  priority = 99999,
  config = true,
  lazy = false,
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
