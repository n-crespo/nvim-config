vim.g.trouble_lualine = false
vim.g.lualine_hide_tabnr = false
local icons = LazyVim.config.icons

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
        always_show_tabline = false, -- only show tabline when >1 tabs
        theme = require("lualine.themes.lualine_theme").theme,
        disabled_filetypes = { statusline = { "snacks_dashboard" } },
        padding = 0,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        refresh = {
          -- tabline = 10000,
          statusline = 100,
        },
      },
      tabline = {
        lualine_a = {
          {
            "tabs",
            show_modified_status = false,
            max_length = vim.o.columns - 2,
            mode = 1,
            padding = 1,
            tabs_color = {
              -- Same values as the general color option can be used here.
              active = "TabLineSel", -- Color for active tab.
              inactive = "TabLineFill", -- Color for inactive tab.
            },
            filetype_names = {
              snacks_terminal = "TERMINAL",
            },

            fmt = function(name, context)
              -- utility function
              local function ignore_buffer(buftype, filetype)
                -- local buftype = ctx.buftype
                -- local filetype = ctx.filetype
                local ignored_buftypes = { "prompt", "nofile", "terminal", "quickfix" }
                local ignored_filetypes = { "snacks_picker_preview" }
                return vim.tbl_contains(ignored_buftypes, buftype) or vim.tbl_contains(ignored_filetypes, filetype)
              end

              local buflist = vim.fn.tabpagebuflist(context.tabnr)
              local bufnr = buflist[1]
              local alt_bufnr = vim.fn.bufnr("#")
              -- local winnr = vim.fn.tabpagewinnr(context.tabnr)

              if name:find(".scratch") then
                name = "scratch"
              elseif ignore_buffer(context.buftype, context.filetype) then
                -- first check alternate file
                if
                  vim.api.nvim_buf_is_valid(alt_bufnr)
                  and not ignore_buffer(vim.bo[alt_bufnr].buftype, vim.bo[alt_bufnr].filetype)
                then
                  name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(alt_bufnr), ":t")
                else
                  -- now check for other possible windows to populate tabline
                  local i = 2
                  local check_bufnr
                  local found
                  while i <= #buflist and not found do
                    check_bufnr = buflist[i]
                    if not ignore_buffer(vim.bo[check_bufnr].buftype, vim.bo[check_bufnr].filetype) then
                      found = true
                    end
                    i = i + 1
                  end
                  if found then
                    name = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ":t")
                  else
                    name = "[No Name]"
                  end
                end
              end

              -- final check for edge cases
              if name == "" then
                name = "[No Name]"
              end

              return name
              -- return ((vim.fn.tabpagenr("$") > 3) and (context.tabnr .. "") or "") .. " " .. name
            end,
            -- cond = function()
            --   return vim.fn.tabpagenr("$") > 1
            -- end,
          },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          {
            function()
              if LazyVim.is_win() then
                return "🪟"
              end
              return ""
            end,
            padding = { left = 1, right = 1 },
            color = "HostNameIcon",
          },
          {
            "hostname",
            padding = { right = 1 },
            -- cond = os.getenv("SSH_CONNECTION") ~= nil
            -- (above could be used to only show this component when ssh-ed)
          },
        },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
            padding = { right = 1 },
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
            color = "WarningMsg",
            padding = 1,
          },
        },
        lualine_x = {
          {
            "diff",
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
            padding = { right = 1 },
          },
        },
        lualine_y = {
          {
            "location",
            cond = function()
              return not string.find(vim.fn.mode():lower(), "[v]")
            end,
            padding = 1,
          },
          { "selectioncount", padding = 1 },
          { "progress", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
      },
    }
    return opts
  end,
  keys = {
    {
      "<leader>r",
      function()
        vim.ui.input({ prompt = "New Tab Name: " }, function(input)
          if input or input == "" then
            vim.cmd("LualineRenameTab " .. input)
          end
        end)
      end,
    },
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
