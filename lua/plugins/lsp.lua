-- lsp configurations
vim.g.lazyvim_python_lsp = "pyright"
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
