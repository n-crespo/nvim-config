return {
  "catgoose/nvim-colorizer.lua",
  dependencies = {
    "folke/snacks.nvim",
    opts = function()
      Snacks.toggle({
        name = "Colorizer Highlights",
        get = function()
          return require("colorizer").is_buffer_attached(0)
        end,
        set = function(state)
          if state then
            require("colorizer").attach_to_buffer(0)
          else
            require("colorizer").detach_from_buffer(0)
          end
        end,
      }):map("<leader>uH")
    end,
  },
  -- event = "BufReadPre",
  ft = { "css", "html", "javascript", "typescript" },
  opts = {
    filetypes = {
      "*",
      noice = { always_update = true },
      blink_menu = { always_update = true },
      blink_docs = { always_update = true },
      cmp_menu = { always_update = true },
      cmp_docs = { always_update = true },
    },
    user_default_options = {
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
  config = function(_, opts)
    require("colorizer").setup(opts)
    vim.api.nvim_create_user_command("REcolor", "lua require('colorizer').reload_all_buffers()", { nargs = 0 })
  end,
}
