return {
  "nvim-cmp",
  dependencies = {
    "Exafunction/codeium.nvim",
    enabled = vim.fn.has("wsl") or vim.fn.has("mac"),
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {
      enable_chat = true,
    },
  },
}
