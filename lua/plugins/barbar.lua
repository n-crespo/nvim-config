return {
  "romgrk/barbar.nvim",
  event = "LazyFile",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    auto_hide = 1,
    tabpages = true,
    highlight_inactive_file_icons = true,
    separator_at_end = false,
    icons = {
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
        [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
        [vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
        [vim.diagnostic.severity.HINT] = { enabled = true, icon = " " },
      },
      gitsigns = {
        added = { enabled = true, icon = "+" },
        changed = { enabled = true, icon = "~" },
        deleted = { enabled = true, icon = "-" },
      },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    keys = {
      {
        "<S-H>",
        "<cmd>BufferPrevious<cr>",
        desc = "Previous buffer",
      },
      {
        "<S-L>",
        "<cmd>BufferNext<cr>",
        desc = "Next buffer",
      },
    },
  },
}
