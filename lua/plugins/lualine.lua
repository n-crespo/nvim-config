vim.g.trouble_lualine = false
return {
  "nvim-lualine/lualine.nvim",
  -- event = { "BufReadPre", "BufNewFile" },
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
        theme = require("custom.lualine_theme").theme,
        disabled_filetypes = { statusline = { "snacks_dashboard" } },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { {} },
        ---@diagnostic disable-next-line: assign-type-mismatch
        lualine_b = { LazyVim.lualine.root_dir({ cwd = true }) },
        lualine_c = {
          { LazyVim.lualine.pretty_path({ relative = "root" }) },
          {
            "diagnostics",
            symbols = {
              error = LazyVim.config.icons.diagnostics.Error,
              warn = LazyVim.config.icons.diagnostics.Warn,
              info = LazyVim.config.icons.diagnostics.Info,
              hint = LazyVim.config.icons.diagnostics.Hint,
            },
          },
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == "" then
                return ""
              end -- not recording
              return "recording @" .. reg
            end,
          },
        },
        lualine_x = {
          {
            require("lualine_require").require("lazy.status").updates,
            cond = require("lualine_require").require("lazy.status").has_updates,
            color = function()
              return { fg = Snacks.util.color("Special") }
            end,
          },
          {
            -- see custom/tabline.lua
            require("custom.tabline").tabline,
            separator = " ",
            padding = { left = 0, right = 1 },
          },
        },
        lualine_y = {
          {
            "progress",
            color = { fg = "#949894" },
          },
        },
        lualine_z = {},
      },
    }
    return opts
  end,
  keys = {
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

-- section_separators = { left = "", right = "" },
-- component_separators = { left = " ", right = "" }
-- component_separators = { left = "", right = "" }
-- section_separators = { left = "", right = "" }
-- section_separators = { left = "", right = "" }
-- section_separators = { left = "", right = "" }
-- section_separators = { left = "", right = "" }
-- component_separators = { left = '', right = ''}
-- section_separators = { left = "", right = "" }
