local function insert_mode_comment()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") then
    -- do special things when on a blank line
    require("Comment.api").insert.linewise.eol()
    vim.api.nvim_feedkeys(" ", "n", false) -- delete the stray "a"
    vim.api.nvim_feedkeys("", "n", false) -- de-indent once cus the eol function does strange things
    return
  else
    local U = require("Comment.utils")
    local ft = require("Comment.ft")
    local comment_str = ft.get(vim.bo.filetype, U.ctype.linewise)

    -- allow fallback to some other buffer-local <C-/> keymap if commentstring
    -- is not defined (snacks.picker uses this for help keymap for example)
    if not comment_str then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-/>", true, false, true), "n", false)
      return
    end

    comment_str = (type(comment_str) == "table") and comment_str[1] or comment_str
    local prefix = comment_str:match("^(.-)%%s") or ""
    local postfix = comment_str:match("%%s(.-)$") or ""

    -- we don't shift the cursor backwards when uncommenting if its already at
    -- the end of the line
    local original_length = #vim.api.nvim_get_current_line()
    local row, old_col = unpack(vim.api.nvim_win_get_cursor(0))
    local cursor_was_at_eol = (old_col == original_length)

    -- either need to shift the cursor forwards or backwards
    require("Comment.api").toggle.linewise.current()

    local _, new_col = unpack(vim.api.nvim_win_get_cursor(0))
    local new_length = #vim.api.nvim_get_current_line()
    local cursor_is_at_eol = (new_col == new_length)

    -- split into opener / closer around the '%s'
    local opener, closer = comment_str:match("^(.-)%%s(.-)$")
    -- trim any stray whitespace
    opener = opener:match("^%s*(.-)%s*$") or ""
    closer = closer:match("^%s*(.-)%s*$") or ""

    -- get the current line and trim it
    line = vim.api.nvim_get_current_line():match("^%s*(.-)%s*$") or ""
    local got_commented
    if closer == "" then
      -- single-sided (line) comment
      got_commented = line:sub(1, #opener) == opener
    else
      -- two-sided (block) comment
      got_commented = line:sub(1, #opener) == opener and line:sub(-#closer) == closer
    end

    local sign = got_commented and 1 or -1
    local diff = sign * (#prefix + 1)

    if not got_commented and (cursor_is_at_eol or cursor_was_at_eol or (old_col + diff > new_col)) then
      vim.notify("not moving")
      -- print("1: moving to: " .. col + diff)
    else
      -- normal case (middle of line)
      vim.notify("moving")
      -- vim.notify("2: moving to: " .. col + diff)
      vim.api.nvim_win_set_cursor(0, { row, math.max(0, new_col + diff) })
    end
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
