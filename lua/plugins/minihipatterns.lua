local short_hex_color = function(_, match)
  local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
  local hex = string.format("#%s%s%s%s%s%s", r, r, g, g, b, b)
  return MiniHipatterns.compute_hex_color_group(hex, "bg")
end

local alpha_hex_color = function(_, match)
  -- Extract RRGGBB and AA components
  local r, g, b, a = match:sub(2, 3), match:sub(4, 5), match:sub(6, 7), match:sub(8, 9)
  -- Combine RGB components for the color
  local hex = string.format("#%s%s%s", r, g, b)
  -- Calculate the background color with alpha applied (for simplicity, ignore alpha)
  return MiniHipatterns.compute_hex_color_group(hex, "bg")
end

local rgb_color = function(_, match)
  -- Extract RGB and alpha components
  local r, g, b, a = match:match("rgb%((%d+)%s+(%d+)%s+(%d+)%s*/%s*(%d+)%%%)")
  if not (r and g and b) then
    return nil
  end

  -- Format RGB into hex
  local hex = string.format("#%02X%02X%02X", tonumber(r), tonumber(g), tonumber(b))

  -- Calculate the alpha percentage (currently ignored for simplicity)
  local alpha = tonumber(a) or 100 -- Default to 100% if no alpha is provided

  -- Return the highlight group based on the RGB color
  return MiniHipatterns.compute_hex_color_group(hex, "bg")
end

return {
  "echasnovski/mini.hipatterns",
  opts = {
    highlighters = {
      hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      short_hex_color = { pattern = "#%x%x%x%f[%X]", group = short_hex_color },
      alpha_hex_color = {
        pattern = "#%x%x%x%x%x%x%x%x%f[%X]", -- Match #RRGGBBAA
        group = alpha_hex_color,
      },
      rgb_color = {
        pattern = "rgb%(%d+%s+%d+%s+%d+%s*/%s*%d+%%%)", -- Match rgb(...) with alpha
        group = rgb_color,
      },
    },
  },
}
