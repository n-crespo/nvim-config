return {
  "rachartier/tiny-glimmer.nvim",
  event = "LazyFile",
  opts = {
    enabled = true,

    default_animation = "fade",
    refresh_interval_ms = 6,

    overwrite = {
      -- settings needs to respect the animation you choose settings
      paste = {
        enabled = true,
        default_animation = "fade",
      },
      search = { enabled = false },
      undo = { enabled = true },
      redo = { enabled = true },
    },

    -- Only use if you have a transparent background
    -- It will override the highlight group background color for `to_color` in all animations
    transparency_color = "#181616",
    virt_text = {
      priority = 99999,
    },
  },
}
