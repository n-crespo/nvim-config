-- makes installing and managing language servers a lot easier
return {
  "williamboman/mason.nvim",
  event = "LspAttach",
  opts = {
    ui = {
      border = "single",
      width = 0.8,
      height = 0.8,
    },
  },
}
