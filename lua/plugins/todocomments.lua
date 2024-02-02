-- also show custom higlighting on things that aren't comments
return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "LazyFile",
  opts = {
    highlight = {
      comments_only = false, -- uses treesitter to match keywords in comments only
    },
  },
}
