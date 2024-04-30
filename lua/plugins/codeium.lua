return {
  "nvim-cmp",
  dependencies = {
    "Exafunction/codeium.nvim",
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {
      enable_chat = true,
    },
  },
}
