return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = {
    filetype = {
      cf = { glyph = "", hl = "MiniIconsBlue" },
      Rmd = { glyph = "", hl = "MiniIconsBlue" },
      rmd = { glyph = "", hl = "MiniIconsBlue" },
      autohotkey = { glyph = "", hl = "MiniIconsGreen" },
    },
    extension = {
      h = { glyph = "", hl = "MiniIconsPurple" },
    },
  },
  config = function(opts)
    require("mini.icons").setup(opts)

    local highlights = {
      "MiniIconsAzure",
      "MiniIconsBlue",
      "MiniIconsCyan",
      "MiniIconsGreen",
      "MiniIconsGrey",
      "MiniIconsOrange",
      "MiniIconsPurple",
      "MiniIconsRed",
      "MiniIconsYellow",
    }

    local hl_get = function(name)
      return vim.api.nvim_get_hl(0, { name = name, link = false })
    end

    local tabs_active = hl_get("lualine_a_tabs_active")
    local tabs_inactive = hl_get("lualine_a_tabs_inactive")

    for _, hl in ipairs(highlights) do
      local icon = hl_get(hl)
      vim.api.nvim_set_hl(0, hl .. "_lualine_a_tabs_active", { fg = icon.fg, bg = tabs_active.bg })
      vim.api.nvim_set_hl(0, hl .. "_lualine_a_tabs_inactive", { fg = icon.fg, bg = tabs_inactive.bg })
    end
  end,
}
