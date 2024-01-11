return {
  -- highlights current indentation level (indent blankline shows other lines)
  -- default LazyVim plugin, this config just removes the animation
  "echasnovski/mini.indentscope",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    exclude = {
      filetypes = { "better_term", "noice" },
    },
    -- fatter line
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
    draw = { delay = 0, animation = require("mini.indentscope").gen_animation.none() },
  },
}
