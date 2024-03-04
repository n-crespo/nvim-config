-- highlights current indentation level (indent blankline shows other lines)
-- default LazyVim plugin, this config just removes the animation
return {
  "echasnovski/mini.indentscope",
  event = "LazyFile", -- only load plugin after a buffer has been opened
  opts = {
    draw = {
      delay = 0,
      animation = function()
        return 0 -- don't show an animation
      end,
    },
  },
  -- ignore these filetypes
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Disable indentscope for certain filetypes",
      pattern = { "better_term" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
