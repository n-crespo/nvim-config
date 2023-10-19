return {
  "echasnovski/mini.indentscope",
  -- version = false,  wait till new 0.7.0 release to put it back on semver
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
    draw = { delay = 0, animation = require("mini.indentscope").gen_animation.none() },
  },
}
