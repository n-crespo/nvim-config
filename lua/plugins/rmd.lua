return {
  -- add functionality for rmarkdown
  {
    "vim-pandoc/vim-rmarkdown",
    ft = { "rmd", "rmarkdown", "Rmd" },
    dependencies = {
      { "vim-pandoc/vim-pandoc-syntax", ft = { "rmd", "rmarkdown", "Rmd" } },
    },
  },
}
