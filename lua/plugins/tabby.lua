return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  enabled = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local theme = {
      head = { bg = "#22272f", fg = "#abb2bf" },
      transparent = { bg = "#121621", fg = nil },
      fill = { fg = "#f2e9de", bg = nil, style = "italic" },
      focused = { fg = "#22272f", bg = nil, style = "italic" },
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
      return {
        {
          { "  ", hl = theme.head },
          line.sep(" ", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.transparent
          local sephl = tab.is_current() and theme.focused or theme.transparent
          local sepright = tab.is_current() and line.sep(" ", hl, sephl) or " "
          local sepleft = tab.is_current() and line.sep(" ", hl, sephl) or " "
          -- local sep1 = tab.is_current() and line.sep("", hl, sephl) or ""
          -- local sep2 = tab.is_current() and line.sep("", hl, sephl) or ""
          return {
            -- sepleft,
            tab.is_current() and " " or " ",
            tab.number(),
            -- TabIcon(tab),
            -- TabName(tab.name()),
            -- sepright,
            " ",
            hl = hl,
            margin = " ",
          }
        end),
        line.spacer(),
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
