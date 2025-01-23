-- lsp configurations
vim.g.lazyvim_python_lsp = "pyright"

-- vim.diagnostic.config({
--   hover = {
--     border = "rounded",
--   },
-- })

-- borders for K (lsp hover)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- disable <C-k> insert mode keymap for focusing signature help window
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<C-K>", false, mode = "i" }

    -- single border for floating diagnostic window ( see in ]d and <leader>cd)
    opts.diagnostics = opts.diagnostics or {}
    opts.diagnostics.float = opts.diagnostics.float or {}
    opts.diagnostics.float.border = "rounded"

    opts.ui = opts.ui or {}
    opts.ui.default_options = opts.ui.default_options or {}
    opts.ui.default_options.border = "rounded"

    return opts
  end,
}
