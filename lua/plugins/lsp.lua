vim.diagnostic.config({
  float = { border = "rounded" },
})

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- disable <C-k> insert mode keymap for focusing signature help window
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<C-K>", false, mode = "i" }
    return opts
  end,
}
