-- local onedark = require("onedarkpro.helpers").get_colors("onedark_dark")

local dgray = "#22272f"
local M = {}

M.theme = function()
  local colors = {
    -- normal = onedark.blue,
    -- visual = onedark.yellow,
    -- replace = onedark.red,
    -- insert = onedark.green,
    -- command = onedark.purple,
    normal = dgray,
    visual = dgray,
    replace = dgray,
    insert = dgray,
    command = dgray,
    innerbg = nil,
    outerbg = "#141414",
    darkgray = "#f2e9de",
    gray = "#f2e9de",
  }

  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
      a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
      a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
      a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
      a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
      a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
  }
end
return M
