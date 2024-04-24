return {
  "tummetott/reticle.nvim",
  event = "VeryLazy", -- optionally lazy load the plugin
  opts = {
    -- add options here if you wish to override the default settings
    never = {
      cursorline = {
        "lazy",
        "starter",
        "cmdline",
        "commandline",
        "term",
        "lazyterm",
        "noice",
        "better_term",
        "minifiles",
      },
    },
  },
}
