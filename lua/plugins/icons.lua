return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override_by_extension = {
        --  support .Rmd as well as .rmd
        ["Rmd"] = {
          icon = "",
          color = "#519aba",
          name = "RMarkdown",
        },
        ["cfm"] = {
          icon = "",
          color = "#7fb0ff",
          name = "ColdFusion",
        },
      },
    },
  },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      filetype = {
        cf = { glyph = "", hl = "MiniIconsBlue" },
      },
    },
  },
}
