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
        vim.cmd([[silent! windo only]])
      end,
    },
  },
}
