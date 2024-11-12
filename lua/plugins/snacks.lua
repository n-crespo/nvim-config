return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      enabled = true,
      style = "fancy",
    },
    words = {
      enabled = false,
    },
    statuscolumn = {
      enabled = true,
      left = { "mark", "sign" }, -- priority of signs on the left (high to low)
      right = { "fold", "git" }, -- priority of signs on the right (high to low)
      folds = {
        open = false, -- show open fold icons
        git_hl = false, -- use Git Signs hl for fold icons
      },
      git = {
        -- patterns to match Git signs
        patterns = { "GitSign", "MiniDiffSign" },
      },
      refresh = 50, -- refresh at most every 50ms
    },
  },
  -- keys = {
  --   {
  --     "<leader>snh",
  --     Snacks.notifier.show_history(),
  --   },
  -- },
}
