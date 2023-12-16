return {
  "echasnovski/mini.files",
  event = "VimEnter",
  opts = {
    options = {
      use_as_default_explorer = true,
    },
  },
  config = function()
    vim.g.mini_files_use_netrw = 0 -- pls use mini files not netrw
  end,
}
