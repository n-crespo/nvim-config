-- highlights current indentation level (indent blankline shows other lines)
-- default LazyVim plugin, this config just removes the animation
return {
  "echasnovski/mini.indentscope",
  enabled = true,
  event = "LazyFile", -- only load plugin after a buffer has been opened
  opts = {
    draw = {
      delay = 0,
      animation = function()
        return 0 -- don't show an animation
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "noice",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "better_term",
        "checkhealth",
        "csv",
        "crunner",
        "lspinfo",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
