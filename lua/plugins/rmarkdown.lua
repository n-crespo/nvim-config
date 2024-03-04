-- support for R-markdown
return {
  "vim-pandoc/vim-rmarkdown",
  ft = { "rmd", "rmarkdown" }, -- only load plugin in rmd files
  dependencies = {
    { "vim-pandoc/vim-pandoc-syntax" },
    {
      "folke/which-key.nvim",
      opts = {
        defaults = {
          ["<Leader>r"] = { name = "+r markdown" },
          ["<Leader>rk"] = { name = "+knit" },
        },
      },
    },
  },
  keys = {
    { "<leader>rkp", [[<cmd>w<cr><cmd>RMarkdown pdf latex_engine="xelatex"<CR>]], desc = "Knit to pdf" }, -- R knit pdf
    { "<leader>rkh", [[<cmd>w<cr><cmd>RMarkdown html<CR>]], desc = "Knit to pdf" }, -- R knit html
  },
}
