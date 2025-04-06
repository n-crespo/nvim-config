vim.g.snacks_animate = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "scratch",
  callback = function()
    vim.bo.filetype = "markdown"
    vim.b.autoformat = false
  end,
})

return {
  "folke/snacks.nvim",
  opts = {
    styles = {
      scratch = { wo = { number = false, cursorline = false, statuscolumn = "" } },
      terminal = { wo = { winbar = "" } },
      notification = { winblend = 100 },
      border = "rounded",
    },
    words = {
      enabled = true,
      modes = { "n" },
    },
    quickfile = { enabled = true },
    animate = { enabled = false },
    input = { enabled = true },
    rename = { enabled = true },
    scratch = {
      ft = "scratch",
      icon = "",
      win = { zindex = 50 },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    scroll = { enabled = false },
  },
  keys = {
    { "<leader>dpp", nil },
    { "<leader>dph", nil },
    { "<leader>dps", nil },
    { "<leader>S", nil },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
  },
}
