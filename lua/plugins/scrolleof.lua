return {
  -- when reaching end of file, maintain scroll off so cursor never hits bottom
  -- of screen
  "Aasim-A/scrollEOF.nvim",
  config = function()
    require("scrollEOF").setup({
      -- The pattern used for the internal autocmd to determine
      -- where to run scrollEOF. See https://neovim.io/doc/user/autocmd.html#autocmd-pattern
      pattern = "*",
      -- Whether or not scrollEOF should be enabled in insert mode
      insert_mode = false,
      -- List of filetypes to disable scrollEOF for.
      disabled_filetypes = { "minifiles" },
      -- List of modes to disable scrollEOF for. see https://neovim.io/doc/user/builtin.html#mode() for available modes.
      disabled_modes = {},
    })
  end,
}
