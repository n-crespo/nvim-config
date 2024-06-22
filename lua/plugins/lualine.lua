-- status line
-- 12 hour time because 'murica
-- transparent bar because transparent is better
return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    opts.options.component_separators = { left = "⟩", right = "⟨" }
    -- opts.options.component_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "▌", right = "▐" }
    -- opts.options.section_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }
    opts.options.theme = require("transparentlualine").theme
    opts.options.disabled_filetypes = {
      statusline = { "starter" },
    }

    opts.sections.lualine_x = {
      -- stylua: ignore
      {
        function()
          local tabs = {}
          local current_tab = vim.fn.tabpagenr()
          for i = 1, vim.fn.tabpagenr("$") do
            local winnr = vim.fn.tabpagewinnr(i)
            local winid = vim.fn.win_getid(winnr, i)
            local bufnr = vim.fn.winbufnr(winid)
            local bufname = vim.fn.bufname(bufnr)
            local name = vim.fn.fnamemodify(bufname, ":t")
            local icon, color =
            require("nvim-web-devicons").get_icon(name, vim.fn.fnamemodify(bufname, ":e"), { default = true })
            if name == "" then
              name = "Empty"  -- Set name to "Empty" if it is empty
            end

            local highlight_group = "LualineTabInactive"
            if i == current_tab then
              highlight_group = "LualineTabActive"
            end

            -- this is quite disgusting innit
      local tab_display = string.format("[%%#%s#%s%%#%s# %s%%*]", color, icon, highlight_group, name)
            table.insert(tabs, tab_display)
          end
          return table.concat(tabs, " ")
        end,
        separator = " ",
        padding = { left = 0, right = 1 },
        cond = function()
          return vim.fn.tabpagenr("$") > 1
        end,
      },
      -- -- the below show the most recently type command (for some reason)
      -- {
      --   function()
      --     return require("noice").api.status.command.get()
      --   end,
      --   cond = function()
      --     return package.loaded["noice"] and require("noice").api.status.command.has()
      --   end,
      --   color = function()
      --     return LazyVim.ui.fg("Statement")
      --   end,
      -- },
      -- -- stylua: ignore
      -- {
      --   function() return require("noice").api.status.mode.get() end,
      --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
      --   color = function() return LazyVim.ui.fg("Constant") end,
      -- },
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = function()
          return LazyVim.ui.fg("Special")
        end,
      },
    }
    opts.sections.lualine_z = {
      function()
        return "  " .. tostring(os.date("%I:%M %p")):gsub("^%s*0", "") -- remove leading 0 and convert to string
      end,
    }
  end,
}
