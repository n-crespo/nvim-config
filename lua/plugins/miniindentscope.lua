-- highlights current indentation level (indent blankline shows other lines)
-- default LazyVim plugin, this config just removes the animation
return {
  "echasnovski/mini.indentscope",
  event = "LazyFile", -- only load plugin after a buffer has been opened
  opts = {
    exclude = {
      filetypes = { "better_term", "noice" },
    },
    -- symbol = "▏",
    symbol = "│",
    options = {
      try_as_border = true,
    },
    draw = {
      delay = 0,
      animation = require("mini.indentscope").gen_animation.none(), -- don't show an animation
    },
  },
}
