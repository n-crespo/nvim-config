return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local theme = {
      head = { bg = "#141414", fg = "#abb2bf" },
      fill = { fg = "#f2e9de", bg = nil, style = "italic" },
      current_tab = { fg = "#f2e9de", bg = "#22272f", style = "bold" },
      tab = { bg = "#141414", fg = "#abb2bf" },
      tail = { bg = "#141414", fg = "#abb2bf" },
    }
    require("tabby.tabline").set(function(line)
      function tab_name(tab)
        return string.gsub(tab, "%[..%]", "")
      end
      return {
        {
          { "  ", hl = theme.head },
          line.sep(" ", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep(" ", hl, theme.fill),
            tab.is_current() and "" or "",
            tab.number(),
            -- tab_name(tab.name()),
            -- tab.close_btn(''), -- show a close button
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        line.spacer(),
        -- shows list of windows in tab
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          local hl = win.is_current() and theme.current_tab or theme.tab
          return {
            line.sep(" ", hl, theme.fill),
            win.file_icon(),
            -- win.is_current() and "" or "",
            win.buf_name(),
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        -- {
        --   line.sep(" ", theme.tail, theme.fill),
        --   { " ", hl = theme.tail },
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
