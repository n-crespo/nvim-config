return {
  "numToStr/Comment.nvim",
  event = "LazyFile",
  opts = {
    -- Add a space b/w comment and the line
    padding = true,
    -- Whether the cursor should stay at its position
    sticky = true,
    -- Lines to be ignored while (un)comment
    ignore = nil,
    -- LHS of toggle mappings in NORMAL mode
    toggler = {
      -- Line-comment toggle keymap
      line = "gcc",
      -- Block-comment toggle keymap
      block = "gbc",
    },
    -- LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      -- Line-comment keymap
      line = "gc",
      -- Block-comment keymap
      block = "gb",
    },
    -- LHS of extra mappings
    extra = {
      -- Add comment on the line above
      above = "gcO",
      -- Add comment on the line below
      below = "gco",
      -- Add comment at the end of line
      eol = "gcA",
    },
    -- note: If given `false` then the plugin won't create any mappings
    mappings = {
      -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      -- Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
    },
  },
  keys = {
    {
      "<C-_>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      mode = "n",
    },
    {
      "<C-_>",
      "<Plug>(comment_toggle_linewise_visual)gv",
      mode = "v",
    },
    {
      "<C-_>",
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
