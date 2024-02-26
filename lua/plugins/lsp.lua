-- lsp configurations
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false }
  end,
  opts = {
    diagnostics = {
      float = {
        border = "rounded",
      },
    },
    servers = {
      arduino_language_server = {},
      pyright = {},
      clangd = {},
      bashls = {},
      jdtls = { enabled = true }, -- java
      jsonls = {},
      lua_ls = { enabled = false }, -- i don't need this and it makes things laggy
      marksman = { enabled = false }, -- i don't need this and it makes things laggy
      r_language_server = {},
      ruff_lsp = {}, -- for python
    },
    setup = {
      jdtls = function()
        return true -- avoid duplicate servers (??)
      end,
      clangd = function()
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()
      end,
    },
  },
}
