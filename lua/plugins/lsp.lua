return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "arduino-language-server",
        "bash-language-server",
        "black",
        "cbfmt",
        "clang-format",
        "clangd",
        "flake8",
        "jdtls",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        -- "marksman",
        "mdformat",
        "pyright",
        "r-languageserver",
        "ruff-lsp",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    },
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      -- make sure mason installs the server
      servers = {
        pyright = {},
        clangd = {},
        arduino_language_server = {},
        bashls = {},
        jdtls = {},
        jsonls = {},
        lua_ls = {},
        r_language_server = {},
        ruff_lsp = {},
      },
      setup = {
        jdtls = function()
          return true -- avoid duplicate servers
        end,
      },
    },
  },
  -- tab for completion
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    require("cmp").setup({
      window = {
        completion = { -- rounded border; thin-style scrollbar
          border = "rounded",
          scrollbar = "║",
        },
        documentation = { -- no border; native-style scrollbar
          -- border = nil
          border = "rounded",
          scrollbar = "║",
          -- scrollbar = ""
        },
      },
    }),
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
