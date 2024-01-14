-- local Util = require("lazyvim.util")
-- local icons = require("lazyvim.config").icons
return {
  -- status bar at bottom of screen
  -- 12 hour time because 'murica
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.theme = require("transparent-lualine").theme
    opts.sections.lualine_z = {
      function()
        return " " .. os.date("%I:%M %p")
      end,
    }
  end,
}

-- transparent lualine a
-- /home/nicolas/.local/share/nvim/lazy/lualine.nvim/lua/lualine/themes/transparent-theme.lua

-- local onedark = require('onedarkpro.helpers').get_colors('onedark_dark')
-- local colors = {
--   normal = onedark.blue,
--   visual = onedark.yellow,
--   replace = onedark.red,
--   insert = onedark.green,
--   command = onedark.purple,
--   innerbg = nil,
--   outerbg = '#22272f',
--   darkgray = '#16161d',
--   gray = '#abb2bf',
-- }
--
-- local M = {
--   inactive = {
--     a = { fg = colors.gray, bg = colors.outerbg, gui = 'bold' },
--     b = { fg = colors.gray, bg = colors.outerbg },
--     c = { fg = colors.gray, bg = colors.innerbg },
--   },
--   visual = {
--     a = { fg = colors.darkgray, bg = colors.visual, gui = 'bold' },
--     b = { fg = colors.gray, bg = colors.outerbg },
--     c = { fg = colors.gray, bg = colors.innerbg },
--   },
--   replace = {
--     a = { fg = colors.darkgray, bg = colors.replace, gui = 'bold' },
--     b = { fg = colors.gray, bg = colors.outerbg },
--     c = { fg = colors.gray, bg = colors.innerbg },
--   },
--   normal = {
--     a = { fg = colors.darkgray, bg = colors.normal, gui = 'bold' },
--     b = { fg = colors.gray, bg = colors.outerbg },
--     c = { fg = colors.gray, bg = colors.innerbg },
--   },
--   insert = {
--     a = { fg = colors.darkgray, bg = colors.insert, gui = 'bold' },
--     b = { fg = colors.gray, bg = colors.outerbg },
--     c = { fg = colors.gray, bg = colors.innerbg },
--   },
--   command = {
--     a = { fg = colors.darkgray, bg = colors.command, gui = 'bold' },
--     b = { fg = colors.gray, bg = colors.outerbg },
--     c = { fg = colors.gray, bg = colors.innerbg },
--   },
-- }
-- return M
