-- use c highlighting for pvs filetype
vim.treesitter.language.register("c", "pvs")
vim.filetype.add({
  extension = { od = "objdump", objdump = "objdump" },
  pattern = {
    [".*%.pvs"] = "pvs",
    [".*%.service"] = "systemd",
    ["%.objdump$"] = "objdump",
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
      "objdump",
    },
  },
}
