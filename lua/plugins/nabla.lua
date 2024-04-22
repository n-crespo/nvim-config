-- this is kinda buggy
return {
  "jbyuki/nabla.nvim",
  keys = {
    { "<leader>p", "<cmd>lua require('nabla').popup({ border='single' })<cr>", desc = "Preview Equation" },
  },
  config = function() --- this is so unreliable, rather just use mkp
    -- require("nabla").enable_virt({
    --   autogen = true,
    --   silent = false,
    --   align_center = true,
    -- })
  end,
}
