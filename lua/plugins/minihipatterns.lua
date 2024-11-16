local short_hex_color = function(_, match)
  local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
  local hex = string.format("#%s%s%s%s%s%s", r, r, g, g, b, b)
  return MiniHipatterns.compute_hex_color_group(hex, "bg")
end

local alpha_hex_color = function(_, match)
  -- Extract RRGGBB and AA components
  local r, g, b, a = match:sub(2, 3), match:sub(4, 5), match:sub(6, 7), match:sub(8, 9)

  -- Convert hex components to decimal numbers
  r, g, b, a = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16), tonumber(a, 16)

  -- Check if the conversion was successful
  if not (r and g and b and a) then
    vim.notify("Invalid hex color: " .. tostring(match), vim.log.levels.WARN)
    return nil
  end

  -- Blend the RGB color with black based on the alpha value (0-255)
  local bg_r, bg_g, bg_b = 0, 0, 0 -- Assuming black background

  -- Calculate the blended RGB values
  local blended_r = math.floor(r * (a / 255) + bg_r * (1 - a / 255))
  local blended_g = math.floor(g * (a / 255) + bg_g * (1 - a / 255))
  local blended_b = math.floor(b * (a / 255) + bg_b * (1 - a / 255))

  -- Format the blended color back into a hex string
  local hex = string.format("#%02X%02X%02X", blended_r, blended_g, blended_b)

  -- Return the highlight group using the blended color
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
    },
  },
}
