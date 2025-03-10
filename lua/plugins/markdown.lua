return {
  -- Use <enter> to follow markdown links (or hyperlinks) and more
  {
    "n-crespo/nvim-markdown",
    enabled = true,
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_math = false
      vim.g.vim_markdown_no_default_key_mappings = 1

      vim.cmd([[map <Plug> <Plug>Markdown_CreateLink]]) -- disable
      vim.cmd([[map <Plug> <Plug>Markdown_Fold]]) -- disable

      vim.cmd([[imap <buffer> <Tab> <Plug>Markdown_Jump]])

      vim.cmd([[imap <buffer> <S-CR> <Plug>Markdown_NewLineBelow]])
      vim.cmd([[map <buffer> <C-C> <Plug>Markdown_Checkbox]])
      vim.cmd([[imap <buffer> <C-C> <Plug>Markdown_Checkbox]])

      vim.cmd([[nmap <buffer> o <Plug>Markdown_NewLineBelow]])
      vim.cmd([[nmap <buffer> O <Plug>Markdown_NewLineAbove]])

      vim.cmd([[nmap <buffer> <CR> <Plug>Markdown_FollowLink]])
      vim.cmd([[imap <buffer> <CR> <Plug>Markdown_NewLineBelow]])
    end,
    keys = {
      {
        "<leader>cs",
        function()
          vim.cmd([[Toc]])
          vim.wo.number = false
          vim.wo.relativenumber = false
        end,
        desc = "Symbols (Markdown TOC)",
        ft = "markdown",
        buffer = true,
      },
    },
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
      render_modes = { "n", "c", "i", "\x16", "t", "o" },
      file_types = { "markdown", "norg", "rmd", "org" },
      latex = { enabled = false },
      win_options = { conceallevel = { rendered = 2 } },
      code = {
        sign = false,
        width = "block",
        position = "left",
        style = "full",
        language_name = true,
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
        icons = { "", "○", "◆", "◇" },
      },
      checkbox = {
        -- position = "overlay",
        checked = { icon = "" },
        unchecked = { icon = "" },
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
  {
    -- preview markdown
    "n-crespo/peek.nvim",
    cond = vim.fn.executable("deno") == 1,
    ft = "markdown",
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        app = {
          "/mnt/c/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe",
          "--new-window",
        }, -- 'webview', 'browser', string or a table of strings
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    keys = {
      {
        "<leader>o",
        function()
          require("peek").open()
        end,
        desc = "Preview Markdown",
        ft = "markdown",
        buffer = true,
      },
    },
  },
}
