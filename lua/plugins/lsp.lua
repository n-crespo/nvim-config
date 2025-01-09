-- lsp configurations
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- disable <C-k> insert mode keymap for focusing signature help window
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<C-K>", false, mode = "i" }

    -- single border for floating diagnostic window
    opts.diagnostics = opts.diagnostics or {}
    opts.diagnostics.float = opts.diagnostics.float or {}
    opts.diagnostics.float.border = "single"

    opts.ui = opts.ui or {}
    opts.ui.default_options = opts.ui.default_options or {}
    opts.ui.default_options.border = "single"

    return opts
  end,
}
