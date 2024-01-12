-- local Util = require("lazyvim.util")
-- local icons = require("lazyvim.config").icons
return {
  -- status bar at bottom of screen
  -- 12 hour time because 'murica
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.theme = require("t-theme").theme
    opts.sections.lualine_z = {
      function()
        return " " .. os.date("%I:%M %p")
      end,
    }
  end,
}
