return {
  "romgrk/barbar.nvim",
  event = "LazyFile",
  dependencies = {
    "tiagovla/scope.nvim",
    opts = {
      hooks = {
        pre_tab_leave = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
        end,
        post_tab_enter = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
        end,
      },
    },
    config = function(_, opts)
      require("scope").setup(opts)
      require("telescope").load_extension("scope")
    end,
    keys = {
      { "<leader>,", "<cmd>Telescope scope buffers<cr>", desc = "Search buffers" },
    },
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
