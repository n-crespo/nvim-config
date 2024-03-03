return {
  "n-crespo/markdowny.nvim",
  ft = "markdown",
  config = function()
    require("markdowny").setup({ filetypes = { "markdown", "txt" } })
    vim.keymap.set("v", "<C-k>", "<cmd>lua require('markdowny').link()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("v", "<C-b>", "<cmd>lua require('markdowny').bold()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("n", "<C-b>", "V<C-b>", { remap = true, silent = true, buffer = 0 })
    vim.keymap.set("v", "<C-i>", "<cmd>lua require('markdowny').italic()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("n", "<C-i>", "V<C-i>", { remap = true, silent = true, buffer = 0 })
    vim.keymap.set("v", "<C-e>", "<cmd>lua require('markdowny').code()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("v", "<C-m>", "<cmd>lua require('markdowny').math()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("n", "<C-m>", "I$<esc>A$", { silent = true, buffer = true })
  end,
}
