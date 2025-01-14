-- status line
-- 12 hour time because 'murica
-- transparent bar because transparent is better
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
        theme = require("lualine_theme").theme,
        disabled_filetypes = { statusline = { "snacks_dashboard" } },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = " ", right = "" }
        -- component_separators = { left = "", right = "" }
        -- section_separators = { left = "", right = "" }
        -- section_separators = { left = "", right = "" }
        -- section_separators = { left = "", right = "" }
        -- section_separators = { left = "", right = "" }
        -- component_separators = { left = '', right = ''}
        -- section_separators = { left = "", right = "" }
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
            -- NOTE this could have potentially been done with the "tabs" lualine
            -- component rather than doing it manually buuuuut the builtin one is weird
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
                  name = "" -- Set name to "Empty" if it is empty
                  icon = ""
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
        },
        lualine_y = {
          { "progress", color = { fg = "#949894" } },
        },
        lualine_z = {
          {
            -- function()
            --   return "󱑎 " .. tostring(os.date("%I:%M %p")):gsub("^%s*0", "") -- remove leading 0 and convert to string
            -- end,
            -- color = { bold = true },
          },
        },
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
