-- this is kinda buggy
return {
  "jbyuki/nabla.nvim",
  enabled = true, --- this is so unreliable, rather just use mkp
  lazy = true,
  ft = "markdown",
  keys = {
    { "<leader>p", "<cmd>lua require('nabla').popup({ border='rounded' })<cr>", desc = "Preview Equation" },
  },
  -- config = function()
  --   -- require("nabla").enable_virt({
  --   --   autogen = true,
  --   --   silent = false,
  --   --   align_center = true,
  --   vim.keymap.set(
  --     "n",
  --     "<leader>p",
  --     "<cmd>lua require('nabla').popup({ border='rounded' })<cr>",
  --     { desc = "Preview Equation" }
  --   )
  -- end,
}
