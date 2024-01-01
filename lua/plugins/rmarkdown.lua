return {
  -- support for R-markdown knitting
  "vim-pandoc/vim-rmarkdown",
  dependencies = {
    { "vim-pandoc/vim-pandoc-syntax" },
  },
  config = function()
    -- R markdown code block
    vim.keymap.set("n", "<leader>Rb", [[i```{r}<cr>```<esc>O]], { desc = "R Code Block", silent = true })
    -- R knit html
    vim.keymap.set("n", "<leader>Rkh", [[:w <cr>:RMarkdown html<CR>]], { silent = true, desc = "R Knit html" })
    -- R knit pdf
    vim.keymap.set(
      "n",
      "<leader>Rkp",
      [[:w <cr>:RMarkdown pdf latex_engine="xelatex"<CR>]],
      { silent = true, desc = "R Knit pdf" }
    )
    -- R heading
    vim.keymap.set(
      "n",
      "<leader>Rh",
      [[i---<CR>title: ""<CR>author: ""<CR>date: "`r Sys.Date()`"<CR>output: html_document<CR>---<CR><CR>```{r setup, include=FALSE}<CR>knitr::opts_chunk$set(echo = TRUE)<CR>```<CR><CR>---<CR><CR>]],
      { desc = "R Header" }
    )

    -- for some reason my r markdown files have a rmd filetpe, this just allows the
    -- headlines plugin to work for them too (Disabled bc it makes things lag)
    require("headlines").setup({
      rmarkdown = require("headlines").config.rmd,
    })
  end,
}
