vim.g.trouble_lualine = false
local icons = LazyVim.config.icons
local fn = vim.fn
local api = vim.api
local tabpagenr = fn.tabpagenr
local tabpagebuflist = fn.tabpagebuflist
local tabpagewinnr = fn.tabpagewinnr
local list_tabpages = api.nvim_list_tabpages
local buf_get_name = api.nvim_buf_get_name
local fn_fnamemodify = fn.fnamemodify

local NO_NAME = "[No Name]"
local BASIC_PADDING = "    "

local icon_get -- mini.icons.get, lazy-loaded below

local ignored_ft = { snacks_picker_preview = true, snacks_picker_input = true }
local ignored_bt = { prompt = true, nofile = true, terminal = true, quickfix = true }

-- only check package.loaded so we stay fully lazy
local function picker_open()
  local P = package.loaded["snacks.picker.core.picker"]
  return P and #P.get() > 0
end

local function ignore_buffer(bufnr)
  local ft, bt, nm = vim.bo[bufnr].filetype, vim.bo[bufnr].buftype, buf_get_name(bufnr)
  return nm == "" or ignored_ft[ft] or ignored_bt[bt] or picker_open()
end

local function get_buffer_name(bufnr, context)
  if picker_open() then
    return vim.g["lualine_tabname_" .. context.tabnr] or ""
  end

  local name = buf_get_name(bufnr)

  if name == "" and vim.bo[bufnr].buflisted then
    vim.g["lualine_tabname_" .. context.tabnr] = NO_NAME
  elseif vim.bo[bufnr].buftype ~= "prompt" and not ignore_buffer(bufnr) then
    vim.g["lualine_tabname_" .. context.tabnr] = fn_fnamemodify(name, ":t")
  end

  return vim.g["lualine_tabname_" .. context.tabnr] or ""
end

-- the fmt for lualine
local fmt = function(_, ctx)
  local tabnr = ctx.tabnr
  local is_cur = (tabnr == tabpagenr())
  local hl = is_cur and "lualine_a_tabs_active" or "lualine_a_tabs_inactive"

  local tps = list_tabpages()
  local custom = vim.g["LualineCustomTabname" .. tps[tabnr]]
  local buflist = tabpagebuflist(tabnr)
  local bufnr = buflist[tabpagewinnr(tabnr)]
  local bufname = buf_get_name(bufnr)

  -- decide raw name
  local name
  if custom and custom ~= "" then
    name = string.upper(custom)
  elseif bufname == "health://" then
    name = "health"
  else
    name = get_buffer_name(bufnr, ctx)
  end

  name = name or ""

  -- number if >3 tabs
  if tabpagenr("$") > 3 then
    name = ("%d %s"):format(tabnr, name)
  end

  -- build icon+text and skip icon for custom name
  local s = ""
  if not (custom and custom ~= "") then
    if not icon_get then
      icon_get = require("mini.icons").get
    end
    local icon, icon_hl = icon_get("file", name)
    s = "%#" .. icon_hl .. "_" .. hl .. "#" .. icon .. " "
  end

  -- append the name itself and standard padding
  s = s .. "%#" .. hl .. "#" .. name .. BASIC_PADDING .. "%*"

  -- lualine wants a leading space
  return " " .. BASIC_PADDING .. s
end

local lualine_mod
local TablineGrp = vim.api.nvim_create_augroup("MyTabline", { clear = true })
vim.api.nvim_create_autocmd({ "TabNew", "TabClosed", "WinEnter", "BufEnter" }, {
  group = TablineGrp,
  desc = "Refresh lualine tabline when tabs, windows or size changes",
  callback = function()
    if not package.loaded["lualine"] then
      return
    end
    lualine_mod = lualine_mod or require("lualine") -- lazy-cache the module
    lualine_mod.refresh({ scope = "all", place = { "tabline" } })
  end,
})

-- cleanup custom tabnames on TabClosed
vim.api.nvim_create_autocmd("TabClosed", {
  group = TablineGrp,
  desc = "Cleanup custom tabname var",
  callback = function(args)
    local tp = tonumber(args.file) -- args.file is the closed tabpage number as a string
    if tp then
      vim.g["LualineCustomTabname" .. tp] = nil
    end
  end,
})

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
        always_show_tabline = false, -- DON'T USE THIS
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
            fmt = fmt, -- previously defined fmt function
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
            draw_empty = false,
            icon = { "" },
            -- color = "DiagnosticOK",
          },
        },
        lualine_c = {
          -- stylua: ignore
          {
            function() return " " end, -- artificial padding
          },
          {
            "filetype",
            icon_only = true,
            padding = 0,
            draw_empty = false,
            -- stylua: ignore
            cond = function() return vim.bo.filetype ~= "minifiles" end,
          },
          {
            LazyVim.lualine.pretty_path(),
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
  },
}
