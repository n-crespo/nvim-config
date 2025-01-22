local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   -- bootstrap lazy.nvim
   -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
    -- lang_extras,
  },
  defaults = {
    lazy = true,
    version = false, -- always use the latest git commit
    -- version = "*",  try installing the latest stable version for plugins that support semver
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = "rounded",
    backdrop = 100,
    wrap = false,
  },
  -- don't show message on config change/reload
  change_detection = { notify = false },
  checker = { enabled = true }, --   automatically check for plugin updates
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tutor",
        "zipPlugin",
        "netrw",
        "netrwSettings",
        "netrwFileHandlers",
        "zip",
        "tar",
        "tarPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "tohtml",
        "tutor",
        "rplugin",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
})
