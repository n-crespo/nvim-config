return {
  "glacambre/firenvim",
  lazy = false,
  build = ":call firenvim#install(0)",
  config = function()
    if vim.g.started_by_firenvim then
      vim.o.laststatus = 0
      vim.opt.guifont = "JetBrainsMono Nerd Font"
      vim.opt.cursorline = false
    end
  end,
}
