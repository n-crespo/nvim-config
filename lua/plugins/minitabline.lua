return {
  "echasnovski/mini.tabline",
  event = "LazyFile",
  version = false,
  config = function()
    require("mini.tabline").setup({
      -- Whether to show file icons (requires 'nvim-tree/nvim-web-devicons')
      show_icons = true,

      -- Whether to set Vim's settings for tabline (make it always shown and
      -- allow hidden buffers)
      set_vim_settings = true,

      -- Where to show tabpage section in case of multiple vim tabpages.
      -- One of 'left', 'right', 'none'.
      tabpage_section = "right",
    })
  end,
}
