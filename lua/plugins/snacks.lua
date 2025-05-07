vim.g.snacks_animate = false

return {
  "folke/snacks.nvim",
  opts = {
    words = { enabled = false },
    scroll = { enabled = false },
    animate = { enabled = false },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    input = { enabled = true },
    rename = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    scratch = {
      ft = "markdown",
      win = { zindex = 50 },
    },
    styles = {
      scratch = { wo = { number = false, cursorline = false, statuscolumn = " " } },
      terminal = { wo = { winbar = "" } },
      notification = { winblend = 100 },
      border = "rounded",
    },
    scope = {
      enabled = true,
      keys = {
        jump = {
          ["[["] = {
            min_size = 1, -- allow single line scopes
            bottom = false,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = "jump to top edge of scope",
          },
          ["]]"] = {
            min_size = 1, -- allow single line scopes
            bottom = true,
            cursor = false,
            edge = true,
            treesitter = { blocks = { enabled = false } },
            desc = "jump to bottom edge of scope",
          },
        },
      },
    },
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
