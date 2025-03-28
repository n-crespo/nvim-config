vim.g.trouble_lualine = false
vim.g.lualine_hide_tabnr = false

return {
  "nvim-lualine/lualine.nvim",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local opts = {
      options = {
        theme = require("lualine.themes.lualine_theme").theme,
        disabled_filetypes = { statusline = { "snacks_dashboard" } },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        refresh = {
          -- tabline = 10000,
          statusline = 100,
        },
      },
      -- tabline = {
      --   lualine_a = {
      --     {
      --       require("custom.tabline"),
      --       -- cond = function()
      --       -- return vim.fn.tabpagenr("$") > 1
      --       -- end,
      --     },
      --   },
      -- },
      sections = {
        lualine_a = {},
        lualine_b = {
          {
            function()
              if LazyVim.is_win() then
                return ""
              end
              return ""
            end,
            padding = { left = 1, right = 1 },
            color = "HostNameIcon",
          },
          {
            "hostname",
            padding = { left = 0, right = 1 },
            -- cond = os.getenv("SSH_CONNECTION") ~= nil
            -- (above could be used to only show this component when ssh-ed)
          },
        },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = LazyVim.config.icons.diagnostics.Error,
              warn = LazyVim.config.icons.diagnostics.Warn,
              info = LazyVim.config.icons.diagnostics.Info,
              hint = LazyVim.config.icons.diagnostics.Hint,
            },
            padding = { left = 1, right = 0 },
          },
          {
            require("lualine_require").require("lazy.status").updates,
            cond = require("lualine_require").require("lazy.status").has_updates,
            color = "Special",
          },
          -- stylua: ignore
          {
            -- this is for showing when a macro is recording
            function() return require("lualine_require").require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("lualine_require").require("noice").api.status.mode.has() end,
            color = "WarningMsg"
          },
        },
        lualine_x = {
          {
            -- tabline can also go on the bottom...
            "diff",
            padding = { left = 1, right = 1 },
          },
        },
        lualine_y = { "progress" },
        lualine_z = {},
      },
    }
    return opts
  end,
  keys = {
    {
      "<leader>uS",
      function()
        vim.o.laststatus = vim.o.laststatus == 0 and 3 or 0
        local msg = vim.o.laststatus == 0 and "Disabled" or "Enabled"
        local level = vim.o.laststatus == 0 and vim.log.levels.WARN or vim.log.levels.INFO
        vim.notify(msg .. " **Statusline**", level)
      end,
      desc = "Toggle Statusline",
    },
    {
      "<A-,>",
      function()
        local current_tab = vim.fn.tabpagenr()
        if current_tab == 1 then
          vim.cmd("tabmove")
        else
          vim.cmd("-tabmove")
        end
        require("lualine").refresh()
      end,
      desc = "Move Tab Left",
    },
    {
      "<A-;>",
      function()
        local current_tab = vim.fn.tabpagenr()
        if current_tab == vim.fn.tabpagenr("$") then
          vim.cmd("0tabmove")
        else
          vim.cmd("+tabmove")
        end
        require("lualine").refresh()
      end,
      desc = "Move Tab Right",
    },
  },
}
