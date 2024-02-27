-- support for R-markdown
return {
  "vim-pandoc/vim-rmarkdown",
  ft = { "rmd", "rmarkdown" }, -- only load plugin in rmd files
  dependencies = { "vim-pandoc/vim-pandoc-syntax" },
  keys = {
    { "<leader>rb", [[i```{r}<cr>```<esc>O]], desc = "R Code Block" }, -- R markdown code block
    {
      "<leader>rh", -- R heading
      [[i---<CR>title: ""<CR>author: "Nicolas Crespo"<CR>date: "`r Sys.Date()`"<CR>output: pdf_document<CR>---<CR><CR>```{r setup, include=FALSE}<CR>knitr::opts_chunk$set(echo = TRUE)<CR>```<CR><CR>---<CR><CR>]],
      desc = "R Code Block",
    },
    { "<leader>rkp", [[<cmd>w<cr><cmd>RMarkdown pdf latex_engine="xelatex"<CR>]], desc = "Knit to pdf" }, -- R knit pdf
    { "<leader>rkh", [[<cmd>w<cr><cmd>RMarkdown html<CR>]], desc = "Knit to pdf" }, -- R knit html
  },
}
