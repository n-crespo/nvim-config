return {
  {
    "ixru/nvim-markdown",
    ft = "markdown",
    config = function()
      -- allows using <CR> to follow markdown links (or hyperlinks) and more
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
        ["markdown"] = { "cbfmt" },
        ["arduino"] = { "clang-format" },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    opts = {
      anti_conceal = { enabled = false },
      render_modes = { "n", "c", "i", "\x16", "t", "no", "V", "nov", "noV", "vs", "v" },
      on = {
        render = function()
          vim.wo.conceallevel = 3
        end,
        clear = function()
          vim.wo.conceallevel = 0
        end,
      },
      file_types = { "markdown", "norg", "rmd", "org", "codecompanion" },
      latex = { enabled = false },
      win_options = { conceallevel = { rendered = 2 } },
      code = {
        sign = true,
        width = "block",
        position = "left",
        style = "full",
        language_icon = false,
        language_name = false,
        right_pad = 2,
        highlight_inline = "DiagnosticOk",
        border = "thick",
      },
      heading = {
        setext = false,
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
    opts = function()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
      local opts = {
        app = {
          "/mnt/c/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe",
          "--new-window",
        }, -- 'webview', 'browser', string or a table of strings
        theme = "dark",
        close_on_bdelete = false,
      }
      return opts
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
