-- use c highlighting for pvs filetype
vim.treesitter.language.register("c", "pvs")
vim.filetype.add({
  pattern = {
    [".*%.pvs"] = "pvs",
    [".*%.service"] = "systemd",
  },
})

return {
  "nvim-treesitter/nvim-treesitter",
  event = "LazyFile",
  opts = {
    incremental_selection = { enable = false },
    ensure_installed = {
      "bash",
      "csv",
      "yaml",
      "xml",
      "vimdoc",
      "css",
    },
  },
}
