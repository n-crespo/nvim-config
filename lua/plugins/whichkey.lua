-- default LazyVim plugin, adds floating window for remembering keymaps
return {
  "folke/which-key.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    window = {
      border = "rounded",
      padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    },
  },
}
