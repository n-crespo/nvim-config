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

local blend_with_background = function(color, alpha)
  -- Terminal's background color (adjust as needed)
  local bg_color = { r = 0, g = 0, b = 0 } -- Assuming black background

  -- Parse the input RGB color
  local r = tonumber(color:sub(2, 3), 16)
  local g = tonumber(color:sub(4, 5), 16)
  local b = tonumber(color:sub(6, 7), 16)

  -- Blend RGB with background using the alpha value
  local blended_r = math.floor(r * alpha + bg_color.r * (1 - alpha))
  local blended_g = math.floor(g * alpha + bg_color.g * (1 - alpha))
  local blended_b = math.floor(b * alpha + bg_color.b * (1 - alpha))

  -- Return the blended color as a hex string
  return string.format("#%02X%02X%02X", blended_r, blended_g, blended_b)
end

local rgb_color = function(_, match)
  -- Extract RGB and alpha components
  local r, g, b, a = match:match("rgb%((%d+)%s+(%d+)%s+(%d+)%s*/%s*(%d+)%%%)")
  if not (r and g and b and a) then
    return nil
  end

  -- Convert RGB to hex
  local hex = string.format("#%02X%02X%02X", tonumber(r), tonumber(g), tonumber(b))

  -- Convert alpha percentage to a scale of 0 to 1
  local alpha = tonumber(a) / 100

  -- Blend with the terminal's background color
  local blended_hex = blend_with_background(hex, alpha)

  -- Return the highlight group with the blended color
  return MiniHipatterns.compute_hex_color_group(blended_hex, "bg")
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
