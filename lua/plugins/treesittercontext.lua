return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = {
    on_attach = function(bufnr)
      return vim.bo[bufnr].filetype ~= "vim"
    end,
  },
}
