vim.g.snacks_animate = false
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
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
    statuscolumn = { enabled = false },
    animate = { enabled = false },
    input = { enabled = true },
    rename = { enabled = true },
    scratch = { enabled = false },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    debug = { enabled = false },
    profiler = {
      enabled = false,
      autocmds = false,
      startup = {
        event = "",
      },
    },
  },
  keys = {
    -- these are all from debug and don't work...
    { "<leader>dph", false, desc = "which_key_ignore", hidden = true },
    { "<leader>dps", false, desc = "which_key_ignore", hidden = true },
    { "<leader>dpp", false, desc = "which_key_ignore", hidden = true },
    -- these are from scratch
    { "<leader>S", false },
    { "<leader>.", false },
    -- <C-.>, <C-S-/>
  },
}
