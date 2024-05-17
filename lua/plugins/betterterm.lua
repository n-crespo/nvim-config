-- use <c-q> to easily toggle a terminal (better than :term)
-- kinda like vscode... (shame)
return {
  "CRAG666/betterTerm.nvim",
  event = "VeryLazy",
  opts = function()
    local betterTerm = require("betterTerm")
    vim.keymap.set({ "n", "t" }, "<C-q>", betterTerm.open, { desc = "Open terminal" })

    -- don't show [Process exited 0] command when terminal is closed
    -- (just send a key when that event is heard) (exclude code runner)
    vim.api.nvim_create_autocmd({ "TermClose" }, {
      callback = function()
        if vim.bo.filetype == "better_term" then
          vim.api.nvim_feedkeys("i", "n", true)
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
        end
      end,
    })
  end,
}
