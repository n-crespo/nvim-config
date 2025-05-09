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
        local success, comment_str = pcall(require("Comment.ft").get, vim.bo.filetype, nil)

        -- allow fallback to some other buffer-local <C-/> keymap if commentstring is not defined
        if not success or not comment_str then
          local matches = {}
          local bufnr = vim.api.nvim_get_current_buf()
          for _, map in ipairs(vim.api.nvim_buf_get_keymap(bufnr, "i")) do
            if map.lhs == "<C-/>" then
              table.insert(matches, map)
            end
          end
          if #matches > 1 then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-/>", true, false, true), "n", false)
            return
          end
          -- show error message if no fallback
          vim.notify("Invalid commentstring for " .. vim.bo.filetype .. "!", vim.log.levels.WARN)
          return
        end

        -- store state of line/cursor before and after commenting
        local original_col = vim.fn.col(".")
        local line_before = vim.api.nvim_get_current_line()
        require("Comment.api").toggle.linewise.current()
        local line_after = vim.api.nvim_get_current_line()

        -- move cursor to correct position after commentstring has been inserted
        local diff = #line_after - #line_before - 1
        vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), original_col + diff })
      end,
      mode = "i",
    },
    -- some terminals read <C-/> as <C-_>
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
        local success, comment_str = pcall(require("Comment.ft").get, vim.bo.filetype, nil)

        -- allow fallback to some other buffer-local <C-/> keymap if commentstring is not defined
        if not success or not comment_str then
          local matches = {}
          local bufnr = vim.api.nvim_get_current_buf()
          for _, map in ipairs(vim.api.nvim_buf_get_keymap(bufnr, "i")) do
            if map.lhs == "<C-/>" then
              table.insert(matches, map)
            end
          end
          if #matches > 1 then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-/>", true, false, true), "n", false)
            return
          end
          -- show error message if no fallback
          vim.notify("Invalid commentstring for " .. vim.bo.filetype .. "!", vim.log.levels.WARN)
          return
        end

        -- store state of line/cursor before and after commenting
        local original_col = vim.fn.col(".")
        local line_before = vim.api.nvim_get_current_line()
        require("Comment.api").toggle.linewise.current()
        local line_after = vim.api.nvim_get_current_line()

        -- move cursor to correct position after commentstring has been inserted
        local diff = #line_after - #line_before - 1
        vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), original_col + diff })
      end,
      mode = "i",
    },
  },
}
