-- better folding with 'h' and 'l' instead of 'za'
return {
  "chrisgrieser/nvim-origami",
  event = "BufReadPost", -- later or on keypress would prevent saving folds
  opts = true, -- needed even when using default config
  setup = function()
    vim.cmd([[set fdm=indent]])
  end,
}
