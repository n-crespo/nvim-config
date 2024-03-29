return {
  {
    "nvim-cmp",
    dependencies = {
      -- codeium
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = {
          enable_chat = true,
        },
        config = function(_, opts)
          require("codeium").setup(opts)
        end,
      },
    },
  },
}
