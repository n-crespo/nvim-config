vim.g.trouble_lualine = false
vim.g.lualine_hide_tabnr = false
local icons = LazyVim.config.icons

-- utility function, returns true if buffer with specified
-- buf/filetype should be ignored by the tabline or not
local function ignore_buffer(bufnr)
  local ignored_buftypes = { "prompt", "nofile", "terminal", "quickfix" }
  local ignored_filetypes = { "snacks_picker_preview" }

  local filetype = vim.bo[bufnr].filetype
  local buftype = vim.bo[bufnr].buftype

  if vim.tbl_contains(ignored_buftypes, buftype) or vim.tbl_contains(ignored_filetypes, filetype) then
    return true
  end

  return vim.api.nvim_buf_get_name(bufnr) == ""
end

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
        -- always_show_tabline = false, -- only show tabline when >1 tabs
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

            fmt = function(name, context)
              local buflist = vim.fn.tabpagebuflist(context.tabnr)
              local winnr = vim.fn.tabpagewinnr(context.tabnr)
              local bufnr = buflist[winnr]

              -- print("bufnr: " .. bufnr)

              -- vim.notify("begin")
              if name:find(".scratch") then
                name = "scratch"
              elseif
                name == "[No Name]"
                and vim.bo[bufnr].filetype == ""
                and (not ignore_buffer(bufnr) or vim.fn.tabpagebuflist(0) == 0)
              then
                name = "[No Name]"
              elseif ignore_buffer(bufnr) then
                local alt_bufnr = vim.fn.bufnr("#")

                -- first check alternate file
                if alt_bufnr ~= -1 and alt_bufnr ~= bufnr and not ignore_buffer(alt_bufnr) then
                  -- using alternate buffer
                  name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(alt_bufnr), ":t")
                else
                  -- try to populate tabline with name of previously visited buffer in this tab
                  local check_bufnr
                  local found
                  local win_ids = vim.api.nvim_tabpage_list_wins(0)
                  for _, win_id in ipairs(win_ids) do
                    check_bufnr = vim.api.nvim_win_get_buf(win_id)
                    if not ignore_buffer(check_bufnr) then
                      found = true
                      break
                    end
                  end
                  if found then
                    -- using buffer found by iterating thorugh buflist
                    name = vim.fn.fnamemodify(vim.fn.bufname(check_bufnr), ":t")
                    if name == "" then
                      return "[No Name]"
                    end
                  else
                    name = "[No Name]"
                  end
                end
              end

              -- include tabnr only if # of tabs > 3
              return ((vim.fn.tabpagenr("$") > 3) and (context.tabnr .. " ") or "") .. name
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
