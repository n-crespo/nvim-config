-- use <c-q> to easily toggle a terminal (better than :term)
-- kinda like vscode... (shame)
return {
  "CRAG666/betterTerm.nvim",
  event = "VeryLazy",
  opts = function()
    local betterTerm = require("betterTerm")
    vim.keymap.set({ "n", "t" }, "<C-q>", betterTerm.open, { desc = "Open terminal" })
  end,
}
