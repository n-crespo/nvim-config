return {
  -- status bar at bottom of screen
  -- 12 hour time because 'murica
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    opts.options.theme = require("transparentlualine").theme
    opts.sections.lualine_z = {
      function()
        return " " .. os.date("%I:%M %p")
      end,
    }
  end,
}
