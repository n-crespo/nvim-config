-- AMAZING plugin that stops nested nvim instances from being created
-- in :term or betterterm, (C-q), using `nvim {file}` will open the file in
-- the primary instance of neovim. Works nicely with autojump and fzf
return {
  "willothy/flatten.nvim",
  lazy = false, -- Ensure that it runs first to minimize delay when opening file from terminal
  opts = {
    callbacks = {
      ---Called before a nested session is opened.
      pre_open = function()
        require("betterTerm").open()
      end,
      -- ---Called after a nested session is opened.
      -- ---@param bufnr buffer
      -- ---@param winnr window
      -- ---@param filetype string
      -- ---@param is_blocking boolean
      -- ---@param is_diff boolean
      -- post_open = function(bufnr, winnr, filetype, is_blocking, is_diff) end,
    },
    window = {
      open = "tab",
    },
  },
}
