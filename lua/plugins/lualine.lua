vim.g.trouble_lualine = false
local icons = LazyVim.config.icons

local NO_NAME = "[Scratch]"

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNew" }, {
  group = vim.api.nvim_create_augroup("ShowTabline", { clear = true }),
  once = true,
  callback = function()
    vim.o.showtabline = 2
  end,
})

-- make sure to refresh lualine when needed
vim.api.nvim_create_autocmd({ "TabNew", "TabClosed", "WinEnter", "BufEnter" }, {
  desc = "Refresh tabline when needed",
  group = vim.api.nvim_create_augroup("TablineReload", { clear = true }),
  callback = function()
    if package.loaded["lualine"] then
      require("lualine").refresh({ scope = "all", place = { "tabline" } })
    end
  end,
})

-- make sure to refresh lualine when needed
vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = "Resize tabline when needed",
  group = "TablineReload",
  callback = function()
    if vim.g.FullsizeTabs then
      require("lualine").refresh({ scope = "all", place = { "tabline" } })
    end
  end,
})

-- delete stored custom tab names when no longer needed
vim.api.nvim_create_autocmd("TabClosed", {
  desc = "Delete stored custom tab names when no longer needed",
  group = vim.api.nvim_create_augroup("CustomTabnameCleanup", { clear = true }),
  callback = function(args)
    local tabpage = args.file
    local var_name = "LualineCustomTabname" .. tabpage
    if vim.g[var_name] ~= nil then
      vim.g[var_name] = nil
    end
  end,
})

local function apply_fullwidth_padding(context, name)
  local n_tabs = vim.fn.tabpagenr("$")

  local margin = n_tabs
  local content_w = vim.o.columns - margin

  local base_w = math.floor(content_w / n_tabs)
  local leftover = content_w - base_w * n_tabs -- < n_tabs
  local tgt_w = (context.tabnr <= leftover) and (base_w + 1) or base_w

  -- visible width of the tabname (strip status‑line escapes)
  local plain = name
    :gsub("%%#.-#", "") -- %#hl#
    :gsub("%%[%d%@].-@", "") -- %@…@
    :gsub("%%[Tt*]", "") -- %T / %* reset

  local vis = vim.fn.strdisplaywidth(plain)
  local pad_needed = tgt_w - vis

  if pad_needed > 0 then
    local left = string.rep(" ", math.floor(pad_needed / 2))
    local right = string.rep(" ", pad_needed - #left)
    name = left .. name .. right
  end
  return name
end

-- returns true if tabline should ignore the name of the currently focused
-- buffer (meaaning the state of the tabline should not change)
local function ignore_buffer(bufnr)
  -- this works for MOST picker preview windows, but (for performance reasons)
  -- if the buffer is loaded already in neovim, picker will not load a preview but
  -- instead put the buffer itself in the preview window, meaning the ft will be
  -- set to that buffer's actual ft, rather than snacks_picker_preview. This
  -- seems to happen most often in the 'buffers' picker.
  local ignored_filetypes = { "snacks_picker_preview", "snacks_picker_input" }
  local ignored_buftypes = { "prompt", "nofile", "terminal", "quickfix" }

  local filetype = vim.bo[bufnr].filetype
  local buftype = vim.bo[bufnr].buftype
  local name = vim.api.nvim_buf_get_name(bufnr)

  return vim.tbl_contains(ignored_buftypes, buftype)
    or vim.tbl_contains(ignored_filetypes, filetype)
    or name == ""
    or vim.fn.mode == "i" -- for some reason this doesn't fully work to stop the picker preview problem
    or name:find(".scratch") -- ignore snacks scratch buffer floating window
end

-- Get buffer name, using alternate buffer or last visited buffer if necessary
local function get_buffer_name(bufnr, context)
  local function get_filename(buf)
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
  end

  -- this makes empty buffers/tabs show "[No Name]"
  if vim.api.nvim_buf_get_name(bufnr) == "" and vim.bo[bufnr].buflisted then
    vim.g["lualine_tabname_" .. context.tabnr] = NO_NAME
  end

  if not ignore_buffer(bufnr) then
    vim.g["lualine_tabname_" .. context.tabnr] = get_filename(bufnr)
  end

  return vim.g["lualine_tabname_" .. context.tabnr] or ""
end

return {
  "nvim-lualine/lualine.nvim",
  event = "LazyFile",
  dependencies = { "echasnovski/mini.icons" },
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
        always_divide_middle = true,
        padding = 0,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        refresh = {
          -- only refresh tabline when absolutely necessary (autocmd + manual refresh)
          tabline = 1000,
          statusline = 100,
        },
      },
      tabline = {
        lualine_a = {
          {
            "tabs",
            show_modified_status = false,
            separator = "",
            tab_max_length = 999999,
            max_length = 900,
            mode = 1,
            padding = { left = 0, right = 0 },
            tabs_color = {
              -- Same values as the general color option can be used here.
              active = "TabLineSel", -- Color for active tab.
              inactive = "TabLineFill", -- Color for inactive tab.
            },

            fmt = function(name, context)
              local buflist = vim.fn.tabpagebuflist(context.tabnr)
              local winnr = vim.fn.tabpagewinnr(context.tabnr)
              local bufnr = buflist[winnr]

              -- detect if tab is currently selected or not
              local tab_hl = (context.tabnr == vim.fn.tabpagenr()) and "lualine_a_tabs_active"
                or "lualine_a_tabs_inactive"

              -- use tabpage number for indexing rather than tabnr to preserve
              -- names while reordering
              local tabpage = vim.api.nvim_list_tabpages()[context.tabnr]
              local custom_name = vim.g["LualineCustomTabname" .. tabpage]

              if custom_name and custom_name ~= "" then
                name = string.upper(custom_name .. " ")
              else
                if vim.api.nvim_buf_get_name(bufnr) == "health://" then
                  -- we are looking at a :checkhealth buffer
                  name = "health"
                else
                  -- we are looking at an actual buffer/a file
                  name = get_buffer_name(bufnr, context)

                  local icon, icon_hl = require("mini.icons").get("file", name)
                  icon_hl = icon_hl .. "_" .. tab_hl

                  name = (name ~= "" and name .. " " or name)
                  name = ("%#" .. icon_hl .. "#" .. icon .. " " .. "%#" .. tab_hl .. "#" .. name)
                end
              end

              -- only include tab numbers if >3 tabs are open
              name = (vim.fn.tabpagenr("$") > 3) and (context.tabnr .. " " .. name) or name

              local padding = "    "
              -- optional full width layout
              if vim.g["FullsizeTabs"] then
                name = apply_fullwidth_padding(context, name)
                padding = ""
              end

              local label = "%#" .. tab_hl .. "#" .. name .. padding .. "%*"
              return " " .. padding .. label -- single leading space lualine expects
            end,
            cond = function()
              return vim.bo.filetype ~= "snacks_dashboard"
            end,
          },
        },
      },
      sections = {
        ------- LEFT SIDE of statusline -----
        lualine_a = {
          {
            function()
              -- only show an icon when ssh-ed
              if os.getenv("SSH_CONNECTION") ~= nil then
                if LazyVim.is_win() then
                  return "🪟"
                end
                return ""
              end
              return ""
            end,
            padding = { left = 1, right = 1 },
            color = "HostNameIcon",
          },
          {
            function()
              return " "
            end,
          },
          ---@diagnostic disable-next-line: assign-type-mismatch
          LazyVim.lualine.root_dir({ cwd = true }),
          {
            function()
              return " "
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            padding = 1,
            icon = { "" },
            -- color = "DiagnosticOK",
          },
        },
        lualine_c = {
          {
            LazyVim.lualine.pretty_path(),
            padding = { left = 1 },
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
            padding = { left = 1 },
          },
          -- {
          --   require("lualine_require").require("lazy.status").updates,
          --   cond = require("lualine_require").require("lazy.status").has_updates,
          --   color = "Special",
          --   padding = { left = 1 },
          -- },
          -- stylua: ignore
          {
            -- this is for showing when a macro is recording
            function() return require("lualine_require").require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("lualine_require").require("noice").api.status.mode.has() end,
            color = "WarningMsg",
            padding = { left = 1 },
          },
        },

        ------- RIGHT SIDE of statusline -----
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
          {
            "selectioncount",
            padding = 1,
            fmt = function(str)
              if str == "" then
                return
              end
              local total_width = 6
              local str_len = #str
              if str_len < total_width and str_len ~= "" then
                local padding = total_width - str_len
                local right_pad = math.floor(padding / 2)
                local left_pad = padding - right_pad
                return string.rep(" ", left_pad) .. str .. string.rep(" ", right_pad)
              else
                return str
              end
            end,
          },
          { "progress", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
      },
    }
    vim.o.showtabline = 2
    return opts
  end,
  keys = {
    {
      "<leader>r",
      function()
        local current_tab = vim.api.nvim_get_current_tabpage()
        vim.ui.input({ prompt = "New Tab Name: " }, function(input)
          if input or input == "" then
            vim.g["LualineCustomTabname" .. current_tab] = input
            require("lualine").refresh({ scope = "all", place = { "tabline" } })
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
        require("lualine").refresh({ scope = "all", place = { "tabline" } })
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
        require("lualine").refresh({ scope = "all", place = { "tabline" } })
      end,
      desc = "Move Tab Right",
    },
    {
      "<leader>uW",
      function()
        vim.g.FullsizeTabs = not vim.g.FullsizeTabs
        require("lualine").refresh({ scope = "all", place = { "tabline" } })
      end,
      desc = "Toggle Full Width Tabs",
    },
  },
}
