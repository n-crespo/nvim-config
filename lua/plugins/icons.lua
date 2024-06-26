return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override_by_extension = {
      --  support .Rmd as well as .rmd
      ["Rmd"] = {
        icon = "",
        color = "#519aba",
        name = "RMarkdown",
      },
      ["cf"] = {
        icon = "",
        color = "#7fb0ff",
        name = "ColdFusion",
      },
    },
  },
}
