return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    ---@class CatppuccinOptions
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        cmp = true,
        fidget = true,
        gitsigns = true,
        harpoon = true,
        lsp_trouble = true,
        mason = true,
        neotest = true,
        noice = true,
        notify = true,
        octo = true,
        telescope = {
          enabled = true,
        },
        treesitter = true,
        treesitter_context = false,
        symbols_outline = true,
        illuminate = true,
        which_key = true,
        barbecue = {
          dim_dirname = true,
          bold_basename = true,
          dim_context = false,
          alt_background = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    },
    { "rose-pine/neovim", name = "rose-pine" },
    {
      "folke/tokyonight.nvim",
      opts = {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      },
    },
    {
      "wuelnerdotexe/vim-enfocado",
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "enfocado",
      },
    },
  },
}
