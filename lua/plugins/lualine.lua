-- status line
-- 12 hour time because 'murica
-- transparent bar because transparent is better
return {
  "nvim-lualine/lualine.nvim",
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
    opts.options.disabled_filetypes = { statusline = { "ministarter" } }
    opts.sections.lualine_a = {
      { "mode" },
    }

    opts.sections.lualine_b = {}

    opts.sections.lualine_c = {
      LazyVim.lualine.root_dir(),
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
          return LazyVim.ui.fg("Special")
        end,
      },
    }
    -- NOTE this could have potentially been done with the "tabs" lualine
    -- component rather than doing it manually buuuuut
    opts.sections.lualine_y = {
      {
        "tabs",
        tab_max_length = 40, -- Maximum width of each tab.
        max_length = 1000000, -- Maximum width of tabs component.

        mode = 1, -- Show only the tab name (no tab number)
        path = 0, -- Just shows the filename
        tabs_color = {
          active = "lualinetabactive", -- Custom highlight group for active tab
          inactive = "lualinetabinactive", -- Custom highlight group for inactive tab
        },
        show_modified_status = true, -- Shows a symbol if the file is modified
        symbols = {
          modified = "[+]",
        },
        fmt = function(name, context)
          -- Get buffer number and name for the current tab
          local buflist = vim.fn.tabpagebuflist(context.tabnr)
          local winnr = vim.fn.tabpagewinnr(context.tabnr)
          local bufnr = buflist[winnr]
          local bufname = vim.fn.bufname(bufnr)
          local short_name = vim.fn.fnamemodify(bufname, ":t")

          -- Handle custom naming
          if short_name == "fish;#toggleterm#1" then
            short_name = "fish"
          end
          if short_name == "" then
            short_name = "empty"
          end
          if short_name == "lazygit" then
            local icon, icon_color = require("nvim-web-devicons").get_icon_by_filetype("fish")
            short_name = "%#" .. icon_color .. "#" .. icon .. "%*" .. " lazygit"
          else
            -- Add icon based on file type and retain its color
            local icon, icon_color =
              require("nvim-web-devicons").get_icon(short_name, vim.fn.fnamemodify(bufname, ":e"), { default = true })
            short_name = "%#" .. icon_color .. "#" .. icon .. "%*" .. " " .. short_name
          end

          -- Mark modified files
          local modified = vim.fn.getbufvar(bufnr, "&mod")
          if modified == 1 then
            short_name = short_name .. " [+]"
          end

          -- Apply custom highlight groups for active and inactive tabs
          if context.current then
            -- Active tab: apply active color highlight
            return "%#lualinetabactive#" .. short_name .. "%*"
          else
            -- Inactive tab: apply inactive color highlight
            return "%#lualinetabinactive#" .. short_name .. "%*"
          end
        end,
      },
    }
    opts.sections.lualine_z = {
      function()
        return "  " .. tostring(os.date("%I:%M %p")):gsub("^%s*0", "") -- remove leading 0 and convert to string
      end,
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
