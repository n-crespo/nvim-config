local function insert_mode_comment()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") then
    -- do special things when on a blank line
    require("Comment.api").insert.linewise.eol()
    vim.api.nvim_feedkeys(" ", "n", false) -- delete the stray "a"
    vim.api.nvim_feedkeys("", "n", false) -- de-indent once cus the eol function does strange things
    return
  else
    local success, comment_str = pcall(require("Comment.ft").get, vim.bo.filetype, nil)

    -- allow fallback to some other buffer-local <C-/> keymap if commentstring is not defined
    if not success or not comment_str then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-/>", true, false, true), "n", false)
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
    return
  end
end

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
      -- super hacky way to insert mode commenting while retaining cursor
      -- position
      insert_mode_comment,
      mode = "i",
    },
    -- some terminals read <C-/> as <C-_>, so define those as well
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
      insert_mode_comment,
      mode = "i",
    },
  },
}
