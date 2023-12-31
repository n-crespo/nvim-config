return {
  -- markdown
  {
    "ixru/nvim-markdown",
    config = function()
      -- markdown table of contents
      vim.keymap.set(
        "n",
        "<leader>mc",
        "<CMD>Toc<CR><CMD>set nornu<CR><cmd>set nonu<cr>",
        { silent = true, desc = "[C]ontents" }
      )
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_toc_autofit = 1
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    config = function()
      -- support for markdown table mode
      vim.keymap.set("n", "<leader>mt", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Table Mode [T]oggle" })
      vim.keymap.del("v", "<leader>T")
      vim.keymap.del("v", "<leader>tt")
      vim.keymap.del("n", "<leader>tt")
      vim.keymap.del("n", "<leader>tm")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>op",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {},
          -- i think these are too fat (check wikipedia unicode)
          -- fat_headline_upper_string = "▄",
          -- line for visual separation
          -- fat_headline_lower_string = "▀",
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)

      -- for some reason my r markdown files have a rmd filetpe, this just allows the
      -- headlines plugin to work for them too (Disabled bc it makes things lag)
      require("headlines").setup({
        rmarkdown = require("headlines").config.rmd,
      })
    end,
  },
  -- suppport for rmd
  {
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
    end,
  },
}
