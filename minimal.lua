local root = vim.fn.fnamemodify("./.repro", ":p")

-- set stdpaths to use .repro
for _, name in ipairs({ "config", "data", "state", "cache" }) do
  vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

-- bootstrap lazy
local lazypath = root .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- install plugins
local plugins = {
  {
    "olimorris/onedarkpro.nvim",
    opts = {
      -- Your OneDarkPro config goes here
    },
    config = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "markdown",
      },
    },
  },

  -- Delete if you do not require LSP
}

require("lazy").setup(plugins, {
  root = root .. "/plugins",
})

-- setup treesitter
local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
  treesitter.setup({
    ensure_installed = "all",
    ignore_install = { "phpdoc" }, -- list of parser which cause issues or crashes
    highlight = { enable = true },
  })
end

vim.cmd("colorscheme onedark")
