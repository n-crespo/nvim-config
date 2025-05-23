local M = {
  {
    "bullets-vim/bullets.vim",
    ft = { "markdown", "text", "gitcommit", "scratch" },
    config = function()
      vim.g.bullets_set_mappings = 1
      vim.g.bullets_enabled_file_types = {
        "markdown",
        "text",
        "gitcommit",
        "scratch",
      }
    end,
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
    config = function(_, opts)
      require("render-markdown").setup(opts)
      Snacks.toggle({
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      }):map("<leader>um")
    end,
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

-- enable marksman lsp/markdown-toc formatter in full config
if vim.g.full_config then
  -- cbfmt requires a config file
  if vim.fn.filereadable(vim.fn.expand("~/.cbfmt.toml")) == 0 then
    vim.api.nvim_echo({
      {
        "Please create a ~/.cbfmt.toml file for markdown codeblock formatting.",
        "WarningMsg",
      },
    }, true, {})
  end
  table.insert(M, {
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          ["markdown"] = { "cbfmt" },
          ["markdown.mdx"] = { "cbfmt" },
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          marksman = {}, -- enable marskamn lsp
        },
      },
    },
  })
end
return M
