return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local theme = {
      head = { bg = "#22272f", fg = "#abb2bf" },
      transparent = { bg = nil, fg = nil },
      fill = { fg = "#f2e9de", bg = nil, style = "italic" },
      focused = { fg = "#22272f", bg = nil, style = "italic" },
      unfocused = { fg = nil, bg = nil },
      current_tab = { fg = "#abb2bf", bg = "#22272f", style = "bold" },
      tab = { bg = "#22272f", fg = "#abb2bf" },
      tail = { bg = "#22272f", fg = "#abb2bf" },
    }
    require("tabby.tabline").set(function(line)
      function TabName(tab)
        return string.gsub(tab, "%[..%]", "")
      end

      function TabIcon(tab)
        tab.wins().foreach(function(win)
          return win.file_icon()
        end)
      end

      local win_is_modified = function(win)
        return vim.bo[win.buf().id].modified
      end

      local tab_is_modified = function(tab)
        local modified = false
        tab.wins().foreach(function(win)
          if win_is_modified(win) then
            modified = true
          end
        end)
        return modified
      end

      return {
        -- {
        --   { "  ", hl = theme.head },
        --   -- line.sep(" ", theme.head, theme.fill),
        -- },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.transparent
          local sephl = tab.is_current() and theme.focused or theme.transparent
          local modified = tab_is_modified(tab) and "" or ""
          local sep1 = tab.is_current() and line.sep("", hl, sephl) or ""
          local sep2 = tab.is_current() and line.sep("", hl, sephl) or ""
          return {
            sep1,
            -- tab.is_current() and "" or "",
            tab.number(),
            -- TabIcon(tab),
            -- TabName(tab.name()),
            modified,
            -- tab.close_btn(''), -- show a close button
            sep2,
            hl = hl,
            margin = " ",
          }
        end),
        line.spacer(),
        -- shows list of windows in tab
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          local hl = win.is_current() and theme.current_tab or theme.transparent
          local sephl = win.is_current() and theme.focused or theme.transparent
          local modified = win_is_modified(win) and "" or ""
          local sep1 = win.is_current() and line.sep("", hl, sephl) or ""
          local sep2 = win.is_current() and line.sep("", hl, sephl) or ""
          return {
            sep1,
            win.file_icon(),
            -- win.is_current() and "" or "",
            win.buf_name(),
            modified,
            sep2,
            hl = hl,
            margin = " ",
          }
        end),
        -- {
        --   line.sep("", theme.tail, theme.fill),
        --   { "  ", hl = theme.tail },
        -- },
        hl = theme.fill,
      }
    end)
  end,
  keys = {
    {
      "<leader>n",
      ":TabRename ",
      silent = false,
    },
  },
}
