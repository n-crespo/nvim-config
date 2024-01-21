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

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- add any other plugins here
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{ "EdenEast/nightfox.nvim" }, -- lazy
}

require("lazy").setup(plugins, {
  root = root .. "/plugins",
})

-- setup treesitter
local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
  treesitter.setup({
    ensure_installed = "markdown",
    ignore_install = { "phpdoc" }, -- list of parser which cause issues or crashes
    highlight = { enable = true },
  })
end

vim.cmd("colorscheme onedark")
