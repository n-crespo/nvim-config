return {
  "akinsho/bufferline.nvim",
  event = "BufEnter",
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = false,
      show_duplicate_prefix = true,
      always_show_bufferline = false,
      show_close_icon = false,
      color_icons = true,
      style_preset = require("bufferline").style_preset.no_italic, -- or bufferline.style_preset.minimal,
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
      separator_style = "thin",
      custom_filter = function(buf_number, buf_numbers)
        local filtered = { "minifiles", "toggleterm", "starter", "lazy" }
        for _, value in ipairs(filtered) do
          if vim.bo[buf_number].filetype ~= value then
            return false
          end
        end
        return true
      end,
    },
  },
  keys = {
    { "<leader>bp", false },
    { "<leader>bl", false },
    { "<leader>br", false },
    { "<leader>bP", false },
    { "]b", false },
    { "[b", false },
    { "]B", false },
    { "[B", false },
  },
}
