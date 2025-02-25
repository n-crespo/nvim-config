return {
  "willothy/flatten.nvim",
  lazy = false,
  config = true,
  opts = {
    window = { open = "tab" },
    hooks = {
      -- if file was opened from a terminal, close that terminal
      pre_open = function()
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_win_get_buf(win)
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = buf })

        if buftype == "terminal" then
          vim.api.nvim_win_close(win, false)
        end
      end,
    },
  },
}
