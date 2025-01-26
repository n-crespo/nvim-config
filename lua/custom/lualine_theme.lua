local M = {}

M.theme = function()
  local innerbg = nil
  local azbg = "#393836"
  local bybg = "#201d1d"
  local gray = "#b4b3a7"

  return {
    inactive = {
      a = { fg = gray, bg = azbg, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
    },
    visual = {
      a = { fg = gray, bg = azbg, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
    },
    replace = {
      a = { fg = gray, bg = azbg, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
    },
    normal = {
      a = { fg = gray, bg = azbg, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
    },
    insert = {
      a = { fg = gray, bg = azbg, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
    },
    command = {
      a = { fg = gray, bg = azbg, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
    },
  }
end
return M
