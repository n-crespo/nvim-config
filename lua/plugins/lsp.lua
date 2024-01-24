return {
  -- lsp configurations
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      -- nav buddy
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
        keys = {
          { "<leader>cs", "<cmd>Navbuddy<cr>", desc = "Navigate Code" },
        },
      },
    },
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
      -- make sure mason installs the server
      servers = {
        pyright = {},
        clangd = {},
        arduino_language_server = {},
        bashls = {},
        jdtls = {},
        jsonls = {},
        -- lua_ls = {},
        -- marksman = {},
        lua_ls = { enabled = false },
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
}
