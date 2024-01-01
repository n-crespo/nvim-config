return {
  -- use <c-q> to easily toggle a terminal (better than :term)
  -- kinda like vscode... (shame)
  "CRAG666/betterTerm.nvim",
  opts = function()
    ---@diagnostic disable-next-line: missing-fields
    require("betterTerm").setup({
      prefix = "terminal-",
    })
    local betterTerm = require("betterTerm")
    vim.keymap.set({ "n", "t" }, "<C-q>", betterTerm.open, { desc = "Open terminal" })
    -- only ever going to use one of these...
    -- vim.keymap.set({ "n", "t" }, "<C-p>", betterTerm.select, { desc = "Open terminal" })
  end,
}
