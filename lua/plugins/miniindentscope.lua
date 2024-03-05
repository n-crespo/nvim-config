-- highlights current indentation level (indent blankline shows other lines)
-- default LazyVim plugin, this config just removes the animation
return {
  "echasnovski/mini.indentscope",
  event = "LazyFile", -- only load plugin after a buffer has been opened
  opts = {
    draw = {
      delay = 0,
      animation = function()
        return 0 -- don't show an animation
      end,
    },
  },
  -- see autocmds.lua for filetype overrides
}
