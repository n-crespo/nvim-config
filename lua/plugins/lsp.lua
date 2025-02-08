-- lsp configurations
vim.g.lazyvim_python_lsp = "pyright"

-- borders for K (lsp hover)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- disable <C-k> insert mode keymap for focusing signature help window
      -- TODO: hello
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<C-K>", false, mode = "i" }

      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        },
      }

      -- single border for floating diagnostic window ( see in ]d and <leader>cd)
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.float = opts.diagnostics.float or {}
      opts.diagnostics.float.border = "rounded"

      opts.ui = opts.ui or {}
      opts.ui.default_options = opts.ui.default_options or {}
      opts.ui.default_options.border = "rounded"

      return opts
    end,
  },
}
