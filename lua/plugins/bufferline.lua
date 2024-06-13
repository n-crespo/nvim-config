return {
  "akinsho/bufferline.nvim",
  event = "BufEnter",
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = false,
      show_duplicate_prefix = true,
      show_close_icon = false,
      color_icons = true,
      style_preset = require("bufferline").style_preset.no_italic, -- or bufferline.style_preset.minimal,
      -- style_preset = {
      --   require("bufferline").style_preset.no_italic,
      -- },
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
      separator_style = "thin",
      custom_filter = function(buf_number, buf_numbers)
        -- filter out filetypes you don't want to see
        if vim.bo[buf_number].filetype ~= "minifiles" then
          return false
        end
        if vim.bo[buf_number].filetype ~= "toggleterm" then
          return false
        end
        if vim.bo[buf_number].filetype ~= "starter" then
          return false
        end
        if vim.bo[buf_number].filetype ~= "lazy" then
          return false
        end
      end,
    },
  },
  keys = {
    { "<leader>bp", false },
    { "<leader>br", false },
    { "<leader>bP", false },
    { "]b", false },
    { "[b", false },
    { "]B", false },
    { "[B", false },
  },
}
