-- status line
-- 12 hour time because 'murica
-- transparent bar because transparent is better
return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    -- opts.options.component_separators = { left = "⟩", right = "⟨" }
    -- opts.options.section_separators = { left = "▌", right = "▐" }
    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "", right = "" }
    opts.options.theme = require("transparentlualine").theme
    opts.options.disabled_filetypes = {
      statusline = { "starter" },
    }
    opts.sections.lualine_z = {
      function()
        return "  " .. tostring(os.date("%I:%M %p")):gsub("^%s*0", "") -- remove leading 0 and convert to string
      end,
    }
  end,
}
