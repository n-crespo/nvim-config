-- status line
-- 12 hour time because 'murica
-- transparent bar because transparent is better
return {
  "nvim-lualine/lualine.nvim",
  enabled = not vim.g.started_by_firenvim,
  event = { "BufReadPre", "BufNewFile" },
  opts = function(_, opts)
    local icons = LazyVim.config.icons
    opts.options.component_separators = { left = " ", right = "" }
    -- opts.options.component_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "", right = "" }
    -- component_separators = { left = '', right = ''}
    opts.options.section_separators = { left = "", right = "" }
    -- opts.options.section_separators = { left = "", right = "" }
    opts.options.theme = require("transparentlualine").theme
    opts.options.disabled_filetypes = { statusline = { "snacks_dashboard" } }
    opts.sections.lualine_a = {
      { "mode" },
    }

    opts.sections.lualine_b = {
      LazyVim.lualine.root_dir(),
    }

    opts.sections.lualine_c = {
      -- LazyVim.lualine.root_dir(),
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { LazyVim.lualine.pretty_path() },
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      {
        function()
          local symbols = {
            status = {
              [0] = "󰚩 ", -- Enabled
              [1] = "󱙺 ", -- Disabled Globally
              [2] = "󱚧 ", -- Disabled for Buffer
              [3] = "󱚧 ", -- Disabled for Buffer filetype
              [4] = "󱚧 ", -- Disabled for Buffer with enabled function
              [5] = "󱚧 ", -- Disabled for Buffer encoding
            },
            server_status = {
              [0] = "󰣺 ", -- Connected
              [1] = "󰣻 ", -- Connecting
              [2] = "󰣽 ", -- Disconnected
            },
          }

          local status, server_status = require("neocodeium").get_status()
          return symbols.status[status] .. symbols.server_status[server_status]
        end,
        color = function()
          return { fg = Snacks.util.color("Special") }
        end,
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
    }
    opts.sections.lualine_x = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = function()
          return { fg = Snacks.util.color("Special") }
        end,
      },
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
              name = "Empty" -- Set name to "Empty" if it is empty
            elseif name == "fish" then
              icon = ""
              name = "terminal"
            elseif name == "lazygit" then
              icon = "󰊢"
            end

            local highlight_group = "LualineTabInactive"
            if i == current_tab then
              highlight_group = "LualineTabActive"
            end

            -- this is quite disgusting innit
            -- local tab_display = string.format("%%#%s#[%s%%#%s# %s]%%*", color, icon, highlight_group, name)
            local tab_display = string.format(
              "%%#%s#[%%#%s#%s %%#%s#%s%%#%s#]",
              highlight_group,
              color,
              icon,
              highlight_group,
              name,
              highlight_group
            )
            table.insert(tabs, tab_display)
          end
          return table.concat(tabs, " ")
        end,
        separator = " ",
        padding = { left = 0, right = 1 },
        -- cond = function()
        --   return vim.fn.tabpagenr("$") > 1 --- show only when more than 1 tab
        -- end,
      },
    }
    -- NOTE this could have potentially been done with the "tabs" lualine
    -- component rather than doing it manually buuuuut the builtin one is weird
    opts.sections.lualine_y = {
      -- scrollbar progress indicator
      {
        function()
          -- local sbar_chars = { "▔", "🮂", "🮃", "🮑", "🮒", "▃", "▂", "▁" }
          -- local sbar_chars = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
          local sbar_chars = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁" }

          local cur_line = vim.api.nvim_win_get_cursor(0)[1]
          local lines = vim.api.nvim_buf_line_count(0)

          local i = math.floor((cur_line - 1) / lines * #sbar_chars) + 1
          local sbar = string.rep(sbar_chars[i], 2)

          return sbar
        end,
        color = { fg = "#949894" },
      },
    }
    opts.sections.lualine_z = {
      {
        function()
          return "󱑎 " .. tostring(os.date("%I:%M %p")):gsub("^%s*0", "") -- remove leading 0 and convert to string
        end,
        color = { bold = true },
      },
    }
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
