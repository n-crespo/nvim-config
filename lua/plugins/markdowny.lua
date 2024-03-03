return {
  "antonk52/markdowny.nvim",
  ft = "markdown",
  config = function()
    require("markdowny").setup({ filetypes = { "markdown", "txt" } })
    vim.keymap.set("v", "<C-k>", "<cmd>lua require('markdowny').link()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("v", "<C-b>", "<cmd>lua require('markdowny').bold()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("n", "<C-b>", "V<C-b>", { remap = true, silent = true, buffer = 0 })
    vim.keymap.set("v", "<C-i>", "<cmd>lua require('markdowny').italic()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("n", "<C-i>", "V<C-i>", { remap = true, silent = true, buffer = 0 })
    vim.keymap.set("v", "<C-e>", "<cmd>lua require('markdowny').code()<cr>gv", { silent = true, buffer = 0 })
    vim.keymap.set("n", "<C-e>", "v$<C-e>gv", { remap = true, silent = true, buffer = 0 })
  end,
}
