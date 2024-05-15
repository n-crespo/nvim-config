-- default LazyVim plugin, adds floating window for remembering keymaps
return {
  "folke/which-key.nvim",
  opts = {
    window = {
      border = "rounded",
      padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    },
    defaults = {
      mode = { "n" },
      ["<leader><tab>"] = { nil },
      ["<leader>t"] = { name = "+tab" },
      ["<leader>o"] = { name = "+open" },
      ["<leader>gh"] = { name = "+hunks" },
    },
  },
}
