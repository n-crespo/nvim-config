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
        opts = {
          window = {
            border = "rounded", -- "rounded", "double", "solid", "none"
            -- or an array with eight chars building up the border in a clockwise fashion
            -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
            size = "60%", -- Or table format example: { height = "40%", width = "100%"}
            position = "50%", -- Or table format example: { row = "100%", col = "0%"}
            scrolloff = nil, -- scrolloff value within navbuddy window
            sections = {
              left = {
                size = "20%",
                border = nil, -- You can set border style for each section individually as well.
              },
              mid = {
                size = "40%",
                border = nil,
              },
              right = {
                -- No size option for right most section. It fills to
                -- remaining area.
                border = nil,
                preview = "leaf", -- Right section can show previews too.
                -- Options: "leaf", "always" or "never"
              },
            },
          },
          node_markers = {
            enabled = true,
            icons = {
              leaf = " ",
              leaf_selected = " → ",
              branch = "  ",
            },
          },
          lsp = {
            auto_attach = true,
          },
        },
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
        marksman = {},
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
