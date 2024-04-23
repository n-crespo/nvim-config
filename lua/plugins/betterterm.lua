-- use <c-q> to easily toggle a terminal (better than :term)
-- kinda like vscode... (shame)
return {
  "CRAG666/betterTerm.nvim",
  event = "VeryLazy",
  opts = function()
    local betterTerm = require("betterTerm")
    vim.keymap.set({ "n", "t" }, "<C-q>", betterTerm.open, { desc = "Open terminal" })

    -- don't show [Process exited 0] command when terminal is closed
    -- (just send a key when that event is heard) AMAZING
    vim.api.nvim_create_autocmd({ "FileType", "TermClose" }, {
      -- default name of better_term terminal is "Term_1"
      pattern = { "Term_1" }, -- this only works because i only ever have one terminal
      callback = function()
        vim.cmd([[call feedkeys('i')]])
      end,
    })
  end,
}
