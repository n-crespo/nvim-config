return {
  "n-crespo/markdowny.nvim",
  ft = "markdown",
  config = function()
    require("markdowny").setup({ filetypes = { "markdown", "txt" } })
    -- <C-k> on selection makes a link with noice ui
    vim.keymap.set("v", "<C-k>", "<cmd>lua require('markdowny').link()<cr>gv", { silent = true, buffer = 0 })
    -- <C-b> bolds line in normal mode, selection in visual mode
    vim.keymap.set("v", "<C-b>", "<cmd>lua require('markdowny').bold()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("n", "<C-b>", "V<C-b>", { remap = true, silent = true, buffer = 0 })
    -- <C-I> italicizes line in normal mode, selection in visual mode
    vim.keymap.set("v", "<C-i>", "<cmd>lua require('markdowny').italic()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("n", "<C-i>", "V<C-i>", { remap = true, silent = true, buffer = 0 })
    -- single `` for visual selection, code block with triple backticks for visual line/block mode
    vim.keymap.set("v", "<C-e>", "<cmd>lua require('markdowny').code()<cr>gv", { silent = true, buffer = 0 })
  end,
}
