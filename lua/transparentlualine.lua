local M = {}

M.theme = function()
  local colors = {
    innerbg = nil,
    bybg = "#201d1d",
    azbg = "#201d1d",
    gray = "#b4b3a7",
  }

  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.bybg },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
      a = { fg = colors.gray, bg = colors.azbg },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
      a = { fg = colors.gray, bg = colors.azbg },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
      a = { fg = colors.gray, bg = colors.azbg },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
      a = { fg = colors.gray, bg = colors.azbg },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
      a = { fg = colors.gray, bg = colors.azbg },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
  }
end
return M
