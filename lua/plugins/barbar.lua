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
    end,
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    tabpages = true,
    highlight_inactive_file_icons = true,
    no_name_title = "[New Buffer]",
    separator_at_end = true,
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
      preset = "default",
    },
  },
  keys = {
    -- { "<C-p>", "<cmd>BufferPick<cr>", desc = "Pick buffer" },
    { "<S-H>", "<cmd>BufferPrevious<cr>", desc = "Previous buffer" },
    { "<S-L>", "<cmd>BufferNext<cr>", desc = "Next buffer" },
    { "<C-S-T>", "<cmd>BufferRestore<cr>", desc = "Restore buffer" },
    { "<leader>bo", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Close all but current buffer" },
    { "<leader>k", "<cmd>BufferClose<cr>", desc = "Close buffer" },
    { "<A-,>", "<cmd>BufferMovePrevious<cr>", desc = "Move buffer left" },
    { "<A-.>", "<cmd>BufferMoveNext<cr>", desc = "Move buffer right" },
  },
}
