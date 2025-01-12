-- old fire.nvim config
do
  return {}
end

return {
  "glacambre/firenvim",
  lazy = false,
  build = ":call firenvim#install(0)",
  module = false,
  enabled = false,
  config = function()
    if vim.g.started_by_firenvim then
      local opt = vim.opt
      vim.o.laststatus = 0
      opt.guifont = "JetBrainsMono Nerd Font"
      opt.cursorline = false
      opt.rnu = false
      opt.nu = false
      opt.signcolumn = "no"
      opt.foldcolumn = "0"
      opt.laststatus = 0
      vim.api.nvim_set_keymap("n", "<Esc><Esc>", "<Cmd>call firenvim#focus_page()<CR>", {})
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = "github.com_*.txt",
        command = "set filetype=markdown",
      })
    end
    vim.g.firenvim_config = {
      localSettings = {
        [".*"] = {
          takeover = "never",
        },
        ["https?://(?:www\\.)?github\\.com/.*"] = {
          cmdline = "neovim",
          content = "text",
          priority = 0,
          selector = "textarea",
        },
      },
    }
  end,
}
