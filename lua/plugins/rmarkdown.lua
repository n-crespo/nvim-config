return {
  -- support for R-markdown knitting
  "vim-pandoc/vim-rmarkdown",
  event = "LazyFile",
  -- event = "BufEnter *.Rmd",
  -- event = "LazyFile",
  -- ft = { "rmd" },
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
    { "<leader>rkh", [[<cmd>w<cr><cmd>RMarkdown html"xelatex"<CR>]], desc = "Knit to pdf" },
  },
  config = function()
    -- vim.keymap.set("n", "<leader>rb", [[i```{r}<cr>```<esc>O]], { desc = "R Code Block", silent = true })
    -- vim.keymap.set("n", "<leader>rkh", [[:w <cr>:RMarkdown html<CR>]], { silent = true, desc = "R Knit html" })
    -- vim.keymap.set(
    --   "n",
    --   "<leader>rkp",
    --   [[:w <cr>:RMarkdown pdf latex_engine="xelatex"<CR>]],
    --   { silent = true, desc = "R Knit pdf" }
    -- )
    -- vim.keymap.set(
    --   "n",
    --   "<leader>rh",
    --   [[i---<CR>title: ""<CR>author: "Nicolas Crespo"<CR>date: "`r Sys.Date()`"<CR>output: pdf_document<CR>---<CR><CR>```{r setup, include=FALSE}<CR>knitr::opts_chunk$set(echo = TRUE)<CR>```<CR><CR>---<CR><CR>]],
    --   { desc = "R Header" }
    -- )

    -- for some reason my r markdown files have a rmd filetpe, this just allows the
    -- headlines plugin to work for them too (Disabled bc it makes things lag)
    require("headlines").setup({
      rmarkdown = require("headlines").config.rmd,
    })
  end,
}
