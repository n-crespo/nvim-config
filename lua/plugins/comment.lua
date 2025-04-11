return {
  "numToStr/Comment.nvim",
  event = "LazyFile",
  opts = {},
  keys = {
    {
      "<C-/>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      mode = "n",
    },
    {
      "<C-/>",
      "<Plug>(comment_toggle_linewise_visual)gv",
      mode = "v",
    },
    {
      "<C-/>",
      function()
        local line_before = vim.api.nvim_get_current_line()
        local cursor_col = vim.fn.col(".")

        require("Comment.api").toggle.linewise.current()

        local line_after = vim.api.nvim_get_current_line()
        if line_after:match("^%s*%-%-%s*$") then
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>A", true, false, true), "n", false)
        else
          local diff = #line_after - #line_before - 1
          vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), cursor_col + diff })
        end
      end,
      mode = "i",
    },
  },
}
