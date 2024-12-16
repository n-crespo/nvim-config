return {
  "glacambre/firenvim",
  lazy = true,
  build = ":call firenvim#install(0)",
  module = false,
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
      vim.keymap.set("i", "<CR>", "<cmd>wq<cr>", { buffer = true })
    end
  end,
}
