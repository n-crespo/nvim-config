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
  init = function()
    -- disable mini-indent scope in terminal and documentation hover
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "better_term", "noice", "man" },
      callback = function()
        ---@diagnostic disable-next-line: inject-field
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
