require("config.lazy")

require("onedarkpro").setup({
  colors = {
    dark = {
      bg = "#080808",
    },
  }, -- Override default colors or create your own
  highlights = {
    --     Error = {
    bg = "#FF0000",
    fg = "#FF0000",
  }, -- Override default highlight groups or create your own
  styles = { -- For example, to apply bold and italic, use "bold,italic"
    types = "NONE", -- Style that is applied to types
    methods = "NONE", -- Style that is applied to methods
    numbers = "NONE", -- Style that is applied to numbers
    strings = "NONE", -- Style that is applied to strings
    comments = "italic", -- Style that is applied to comments
    keywords = "NONE", -- Style that is applied to keywords
    constants = "NONE", -- Style that is applied to constants
    functions = "NONE", -- Style that is applied to functions
    operators = "NONE", -- Style that is applied to operators
    variables = "NONE", -- Style that is applied to variables
    parameters = "NONE", -- Style that is applied to parameters
    conditionals = "NONE", -- Style that is applied to conditionals
    virtual_text = "bold", -- Style that is applied to virtual text
  },
  filetypes = { -- Override which filetype highlight groups are loaded
    comment = true,
    go = true,
    html = true,
    java = true,
    javascript = true,
    lua = true,
    markdown = true,
    php = true,
    python = true,
    ruby = true,
    rust = true,
    scss = true,
    toml = true,
    typescript = true,
    typescriptreact = true,
    vue = true,
    xml = true,
    yaml = true,
  },
  plugins = { -- Override which plugin highlight groups are loaded
    flash_nvim = false,
    gitsigns = true,
    indentline = true,
    lsp_semantic_tokens = true,
    marks = true,
    mini_indentscope = true,
    nvim_cmp = true,
    nvim_bqf = true,
    nvim_hlslens = true,
    nvim_lsp = true,
    nvim_navic = true,
    nvim_notify = true,
    nvim_ts_rainbow = true,
    telescope = true,
    toggleterm = false,
    treesitter = true,
    trouble = true,
    which_key = true,
  },
  options = {
    cursorline = false, -- Use cursorline highlighting?
    transparency = false, -- Use a transparent background?
    terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
    highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
  },
})

vim.cmd("color onedark_dark")

-- for some reason my r markdown files have a rmd filetpe, this just allows the
-- headlines plugin to work for them too
require("headlines").setup({
  rmarkdown = require("headlines").config.rmd,
})
