vim.g.snacks_animate = false
-- vim.g.snac
return {
  "folke/snacks.nvim",
  opts = {
    styles = {
      border = "rounded",
      terminal = { wo = { winbar = "" } },
      notification = { winblend = 100 },
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
      ft = "markdown",
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    scroll = { enabled = false },
  },
  keys = {
    { "<leader>dpp", nil },
    { "<leader>dph", nil },
    { "<leader>dps", nil },
    -- { "<leader>S", nil },
    -- { "<leader>.", nil },
    -- <C-.>, <C-S-/>
  },
}
