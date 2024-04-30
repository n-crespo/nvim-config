local azbg = "#393836"

local M = {}

M.theme = function()
  local colors = {
    normal = azbg,
    visual = azbg,
    replace = azbg,
    insert = azbg,
    command = azbg,
    innerbg = nil,
    bybg = "#201d1d",
    darkgray = "#b4b3a7",
    gray = "#b4b3a7",
  }

  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.bybg, gui = "bold" },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
      a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
      a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
      a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
      a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
      a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
  }
end
return M
