local M = {}

M.theme = function()
  local colors = {
    innerbg = nil,
    azbg = "#353131",
    bybg = "#201d1d",
    gray = "#C5C9C5",
  }

  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.azbg, bold = true },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
      a = { fg = colors.gray, bg = colors.azbg, bold = true },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
      a = { fg = colors.gray, bg = colors.azbg, bold = true },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
      a = { fg = colors.gray, bg = colors.azbg, bold = true },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
      a = { fg = colors.gray, bg = colors.azbg, bold = true },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
      a = { fg = colors.gray, bg = colors.azbg, bold = true },
      b = { fg = colors.gray, bg = colors.bybg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
  }
end
return M
