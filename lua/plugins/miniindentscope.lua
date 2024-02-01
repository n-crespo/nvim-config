-- highlights current indentation level (indent blankline shows other lines)
-- default LazyVim plugin, this config just removes the animation
return {
  "echasnovski/mini.indentscope",
  event = "LazyFile", -- only load plugin after a buffer has been opened
  opts = {
    -- don't show an animation
    draw = {
      delay = 0,
      animation = function()
        return 0
      end,
    },
  },
  -- ignore these filetypes
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Disable indentscope for certain filetypes",
      pattern = {
        "help",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "better_term",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
