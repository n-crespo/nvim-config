return {
  "nvim-cmp",
  enabled = vim.fn.has("wsl") or vim.fn.has("mac"),
  dependencies = {
    "Exafunction/codeium.nvim",
    cmd = "Codeium",
    build = ":Codeium Auth",
    opts = {
      enable_chat = true,
    },
  },
}
