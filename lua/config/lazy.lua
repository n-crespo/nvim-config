local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local full_config = vim.env.NVIM_FULL_CONFIG == "true"

---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
   -- bootstrap lazy.nvim
   -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  colorscheme = "macro",
  spec = {
    -- import default LazyVim plugins (some disabled in disabled.lua)
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- these will only be enabled if you set the environment variable
    -- NVIM_MAIN_CONFIG to true (in your ~/.bashrc, ~/.zshrc, config.fish, ect)
    -- note: always-enabled extras are in lazyvim.json
    { import = "lazyvim.plugins.extras.dap.core", cond = full_config },
    { import = "lazyvim.plugins.extras.lang.python", cond = full_config },
    { import = "lazyvim.plugins.extras.lang.json", cond = full_config },
    { import = "lazyvim.plugins.extras.lang.tailwind", cond = full_config },
    { import = "lazyvim.plugins.extras.lang.toml", cond = full_config },
    { import = "lazyvim.plugins.extras.lang.yaml", cond = full_config },
    { import = "lazyvim.plugins.extras.lang.typescript", cond = full_config },
    { import = "lazyvim.plugins.extras.ui.treesitter-context", cond = full_config },
    { import = "lazyvim.plugins.extras.util.dot", cond = full_config },
    -- { import = "lazyvim.plugins.extras.lang.java", cond = full_config },

    -- this enables user define plugins, from ../plugins/
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false, -- always use the latest git commit
    -- version = "*",  try installing the latest stable version for plugins that support semver
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = "rounded",
    wrap = false,
  },
  -- don't show message on config change/reload
  change_detection = { notify = false },
  checker = { enabled = false, notify = false }, --   automatically check for plugin updates
  profiling = { require = true },
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
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "tohtml",
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
