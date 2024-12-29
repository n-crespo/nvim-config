return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = {
      "*",
      noice = { always_update = true },
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
    },
  },
}
