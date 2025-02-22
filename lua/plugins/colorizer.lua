vim.api.nvim_create_user_command("AttachOrReloadColors", function()
  if package.loaded["colorizer"] then
    require("colorizer").reload_all_buffers()
  end
  require("colorizer").attach_to_buffer(0)
end, { nargs = 0 })

return {
  "catgoose/nvim-colorizer.lua",
  ft = { "css", "html", "javascript", "typescript", "lua", "json" },
  opts = {
    lazy_load = true,
    filetypes = {
      "*",
      noice = { always_update = true },
      blink_menu = { always_update = true },
      blink_docs = { always_update = true },
      cmp_menu = { always_update = true },
      cmp_docs = { always_update = true },
    },
    buftypes = {
      -- exclude prompt and popup buftypes from highlight
      "!prompt",
      "!popup",
    },
    user_default_options = {
      tailwind = true,
      tailwind_opts = { -- Options for highlighting tailwind names
        update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
      },
      names_opts = { -- options for mutating/filtering names.
        lowercase = false, -- name:lower(), highlight `blue` and `red`
        camelcase = false, -- name, highlight `Blue` and `Red`
        uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
        strip_digits = true, -- ignore names with digits,
        -- highlight `blue` and `red`, but not `blue3` and `red4`
      },
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      RGB = false, -- #RGB hex codes
      RGBA = false,
    },
  },
  keys = {
    {
      "<leader>uH",
      function()
        local attached = require("colorizer").is_buffer_attached()
        if not attached then
          require("colorizer").attach_to_buffer(0)
          vim.notify("Enabled **Colorizer Highlights**", vim.log.levels.INFO, { title = "Tabs" })
        else
          require("colorizer").detach_from_buffer(0)
          vim.notify("Disabled **Colorizer Highlights**", vim.log.levels.WARN, { title = "Tabs" })
        end
      end,
      desc = "Toggle Colorizer",
    },
  },
}
