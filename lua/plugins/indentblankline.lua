-- indent guides, pretty simple
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "LazyFile",
  opts = {
    scope = {
      enabled = false,
    },
    exclude = {
      filetypes = {
        "better_term",
        "lazy",
        "noice",
        "csv",
        "snacks_dashboard",
      },
    },
  },
}
