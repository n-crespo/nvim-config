-- indent guides, pretty simple
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "LazyFile",
  opts = {
    exclude = {
      filetypes = {
        "better_term",
        "lazy",
      },
    },
  },
}
