return {
  "kevinhwang91/rnvimr",
  config = function()
    -- support for ranger plugin
    vim.keymap.set("n", "<leader>e", "<CMD>RnvimrToggle<CR>", { silent = true, desc = "[E]xplore" })
    -- use <tab> to switch layouts (sizes)
    vim.g.rnvimr_enable_ex = 1
    vim.g.rnvimr_edit_cm = "$EDITOR"
  end,
}
