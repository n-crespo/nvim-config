return {
  "willothy/flatten.nvim",
  priority = 99999,
  enabled = true,
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
