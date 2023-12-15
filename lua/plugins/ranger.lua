return {
  "kevinhwang91/rnvimr",
  config = function()
    -- support for ranger plugin
    vim.keymap.set("n", "<leader>e", "<CMD>RnvimrToggle<CR>", { silent = true, desc = "[E]xplore" })
  end,
}
