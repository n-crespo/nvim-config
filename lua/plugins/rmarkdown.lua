-- support for R-markdown
return {
  "vim-pandoc/vim-rmarkdown",
  ft = "rmd", -- only load plugin in rmd files
  dependencies = {
    { "vim-pandoc/vim-pandoc-syntax" },
  },

  keys = {
    -- R markdown code block
    { "<leader>rb", [[i```{r}<cr>```<esc>O]], desc = "R Code Block" },
    -- R heading
    {
      "<leader>rh",
      [[i---<CR>title: ""<CR>author: "Nicolas Crespo"<CR>date: "`r Sys.Date()`"<CR>output: pdf_document<CR>---<CR><CR>```{r setup, include=FALSE}<CR>knitr::opts_chunk$set(echo = TRUE)<CR>```<CR><CR>---<CR><CR>]],
      desc = "R Code Block",
    },
    -- R knit pdf
    { "<leader>rkp", [[<cmd>w<cr><cmd>RMarkdown pdf latex_engine="xelatex"<CR>]], desc = "Knit to pdf" },
    -- R knit html
    { "<leader>rkh", [[<cmd>w<cr><cmd>RMarkdown html<CR>]], desc = "Knit to pdf" },
  },
  config = function()
    -- for some reason my r markdown files have a rmd filetpe, this just allows the
    -- headlines plugin to work for them too
    require("headlines").setup({
      rmarkdown = require("headlines").config.rmd,
    })
    -- note to future self: headlines gives me better horizontal lines and block quotes
  end,
}
