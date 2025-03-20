local M = {}

M.theme = function()
  -- local innerbg = "#2e2e2e"
  local innerbg = nil
  local azbg = "#2E2E2E"
  local bybg = "#201d1d"
  local gray = "#b4b3a7"
  local tabline = "#2e2e2e"

  -- local innerbg = nil
  -- local azbg = "#393836"
  -- local bybg = "#201d1d"
  -- local gray = "#b4b3a7"

  return {
    inactive = {
      a = { fg = gray, bg = tabline, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
      d = { bg = tabline },
    },
    visual = {
      a = { fg = gray, bg = tabline, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
      d = { bg = tabline },
    },
    replace = {
      a = { fg = gray, bg = tabline, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
      d = { bg = tabline },
    },
    normal = {
      a = { fg = gray, bg = tabline, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
      d = { bg = tabline },
    },
    insert = {
      a = { fg = gray, bg = tabline, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
      d = { bg = tabline },
    },
    command = {
      a = { fg = gray, bg = tabline, bold = true },
      b = { fg = gray, bg = bybg },
      c = { fg = gray, bg = innerbg },
      d = { bg = tabline },
    },
  }
end
return M
