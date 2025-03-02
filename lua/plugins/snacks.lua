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
      ft = "scratch",
      icon = "✏️",
      win = { zindex = 50 },
    },
    lazygit = {
      config = { os = { editPreset = "nvim" } },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    scroll = { enabled = false },
  },
  keys = {
    { "<leader>dpp", nil },
    { "<leader>dph", nil },
    { "<leader>dps", nil },
  },
}
