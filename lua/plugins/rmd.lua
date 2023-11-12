vim.g.pandoc_modules_enabled = {}
vim.g.pandoc_filetypes_pandoc_markdown = 0
return {
  -- add functionality for rmarkdown
  {
    "vim-pandoc/vim-rmarkdown",
    ft = { "rmd", "rmarkdown", "Rmd" },
    dependencies = {
      -- { "vim-pandoc/vim-pandoc", ft = { "rmd", "rmarkdown", "Rmd" } },
      { "vim-pandoc/vim-pandoc-syntax", ft = { "rmd", "rmarkdown", "Rmd" } },
    },
  },
}
