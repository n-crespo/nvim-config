return {
  "willothy/flatten.nvim",
  lazy = false,
  config = true,
  opts = {
    window = { open = "tab" },
    hooks = {
      pre_open = function()
        -- if file was opened from a terminal, close that terminal
        if vim.bo.buftype == "terminal" then
          vim.api.nvim_win_close(0, false)
        end
      end,
    },
  },
}
