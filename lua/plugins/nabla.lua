-- this is kinda buggy
return {
  "jbyuki/nabla.nvim",
  lazy = true,
  ft = "markdown",
  keys = {
    { "<leader>cp", "<cmd>lua require('nabla').popup({ border='rounded' })<cr>", desc = "Preview Equation" },
  },
  config = function()
    require("nabla").enable_virt({
      autogen = true,
      silent = true,
    })
  end,
}
