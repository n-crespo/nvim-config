return {
  "wuelnerdotexe/vim-enfocado",
  lazy = false,
  config = function()
    require("lualine").setup({
      options = { theme = "enfocado" },
      sections = { lualine_z = {
        function()
          return "" .. os.date("%I:%M %p")
        end,
      } },
    })
    vim.cmd([[let g:enfocado_style = 'nature' " Available: `nature` or `neon`.]])
    vim.cmd([[colorscheme enfocado]])
  end,
}
