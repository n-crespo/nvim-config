return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = false,
    },
    ensure_installed = {
      "csv",
      "bash",
      "yaml",
      "xml",
      "vimdoc",
      "latex",
    },
  },
  init = function()
    vim.api.nvim_create_augroup("cmdwin_treesitter", { clear = true })
    vim.api.nvim_create_autocmd("CmdwinEnter", {
      pattern = "*",
      command = "TSBufDisable incremental_selection",
      group = "cmdwin_treesitter",
      desc = "Disable treesitter's incremental selection in Command-line window",
    })
  end,
}
