local colors = require("onedarkpro.helpers").get_colors("onedark_dark")
local config = require("onedarkpro.config").config
local inactive_bg = config.options.highlight_inactive_windows and colors.color_column or colors.bg

local M = {}

M.theme = function()
  return {
    normal = {
      a = { bg = colors.green, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.green },
      c = { bg = colors.bg_statusline, fg = colors.fg },
    },

    insert = {
      a = { bg = colors.blue, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.blue },
    },

    command = {
      a = { bg = colors.purple, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.purple },
    },

    visual = {
      a = { bg = colors.yellow, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.yellow },
    },

    replace = {
      a = { bg = colors.red, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.red },
    },

    inactive = {
      a = { bg = inactive_bg, fg = colors.blue },
      b = { bg = inactive_bg, fg = colors.fg_gutter_inactive, gui = "bold" },
      c = { bg = inactive_bg, fg = colors.fg_gutter_inactive },
    },
  }
end

return M
