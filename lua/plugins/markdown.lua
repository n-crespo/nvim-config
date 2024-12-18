-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <zh> to fold headers.
return {
  {
    "n-crespo/nvim-markdown",
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_math = false
      vim.cmd([[map zh <Plug>Markdown_Fold]])
      vim.cmd([[map <Plug> <Plug>Markdown_CreateLink]])
      vim.cmd([[imap <S-CR> <Plug>Markdown_NewLineBelow]])
      vim.cmd([[map o <Plug>Markdown_NewLineBelow]])
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      render_modes = { "n", "c", "i", "v", "V", "\x16", "t", "o" },
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        sign = false,
        width = "block",
      },
      heading = {
        sign = false,
        icons = {},
      },
      quote = {
        icon = "┃",
      },
      bullet = {
        -- icons = { "●", "○", "◆", "◇" },
        -- icons = { "◉", "○", "✸", "✿" },
        icons = { "", "○", "◆", "◇" },
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    keys = {
      {
        "<leader>um",
        function()
          require("render-markdown").toggle()
        end,
        desc = "Toggle Markdown Preview",
      },
    },
  },
}
