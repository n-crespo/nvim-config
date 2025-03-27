local theme = {
  fill = "TablineFill",
  current_tab = "TabLineSel",
  tab = "TabLine",
}
return {
  "nanozuki/tabby.nvim",
  event = "VeryLazy",
  opts = {
    line = function(line)
      return {
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep("", hl, theme.fill),
            -- tab.is_current() and "" or "󰆣",
            tab.number(),
            tab.name(),
            -- tab.close_btn(""),
            line.sep(" ", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
      }
    end,
  },
  keys = {
    {
      "<leader>r",
      function()
        vim.ui.input({ prompt = "Enter new tab name: " }, function(input)
          if input then
            vim.cmd("TabRename " .. input)
          end
        end)
      end,
    },
  },
}
