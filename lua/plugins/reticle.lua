return {
  "tummetott/reticle.nvim",
  event = "VeryLazy", -- optionally lazy load the plugin
  opts = {
    never = {
      cursorline = {
        "lazy",
        "starter",
        "cmdline",
        "commandline",
        "term",
        "lazyterm",
        "telescope",
        "noice",
        "better_term",
        "notify",
        "toggleterm",
      },
    },
  },
}
