-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <zh> to fold headers.
return {
  {
    "n-crespo/nvim-markdown",
    enabled = true,
    ft = "markdown",
    branch = "follow-anchor-links",
    config = function()
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_math = true
      vim.g.vim_markdown_no_default_key_mappings = 0
      vim.cmd([[map <Plug> <Plug>Markdown_CreateLink]]) -- disable
      vim.cmd([[imap <buffer> <S-CR> <Plug>Markdown_NewLineBelow]])
      vim.cmd([[imap <buffer> <CR> <Plug>Markdown_NewLineBelow]])

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.keymap.set("n", "<leader>cs", function()
            vim.cmd([[Toc]])
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
            -- vim.keymap.set("n", "<CR>", "<cr>:lcl<cr>", { buffer = true })
          end, { buffer = true, silent = true, desc = "Table of Contents (Symbols)" })
        end,
      })
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
      latex = { enabled = false },
      code = {
        sign = false,
        width = "block",
        position = "left",
        style = "full",
        language_name = false,
        right_pad = 2,
      },
      heading = {
        sign = false,
        position = "inline",
        border = false,
        left_pad = 1,
        right_pad = 1,
        width = "block",
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
      indent = { enabled = false },
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
