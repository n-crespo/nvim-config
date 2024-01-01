return {
  -- better native folding with h and l
  -- use l to expand any fold, use h at the first character of any line to
  -- toggle indent fold
  "chrisgrieser/nvim-origami",
  event = "BufReadPost", -- later or on keypress would prevent saving folds
  opts = true, -- needed even when using default config
}
