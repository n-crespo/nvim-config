-- refresh lualine whenever codeium server does something or plugin itself
-- is disabled

vim.api.nvim_create_autocmd("User", {
  pattern = { "NeoCodeiumServer*", "NeoCodeium*{En,Dis}abled" },
  callback = function()
    require("lualine").refresh()
  end,
})

-- Toggle Codeium Completion, in buffer or global scope.
---@param opts? {scope: "global"|"buffer"}
function ToggleCodeium(opts)
  opts = opts or { scope = "global" }

  local notify_opts = { title = "Codeium" }
  local commands = require("neocodeium.commands")
  local status, server = require("neocodeium").get_status()

  if server == 2 or status > 0 then -- server of plugin is disabled
    commands.enable()
    commands.enable_buffer()
    vim.notify("NeoCodeium: enabled", vim.log.levels.INFO, notify_opts)
    if opts.scope == "buffer" then
      vim.notify("NeoCodeium: enabled in buffer", vim.log.levels.INFO, notify_opts)
    end
  elseif server == 0 then -- server running
    if opts.scope == "buffer" then
      commands.disable_buffer() -- stop the server
      vim.notify("NeoCodeium: disabled in buffer", vim.log.levels.WARN, notify_opts)
    else
      commands.disable(true)
      vim.notify("NeoCodeium: disabled", vim.log.levels.WARN, notify_opts)
    end
  end
end

-- Enables icon in statusline showing status of AI completion
vim.g.lualine_ai_status = true
return {
  {
    "monkoose/neocodeium",
    lazy = true,
    cond = not LazyVim.is_win(),
    opts = {
      max_lines = 500, -- restrict num of lines read from non-focused buffers
      enabled = false, -- don't enable on start
      manual = false, -- require <C-n>?
      show_label = false, -- thing next to line numbers
      silent = false, -- notification when server is started
      filetypes = {
        help = false,
        gitcommit = false,
        gitrebase = false,
        TelescopePrompt = false,
        minifiles = false,
        ["dap-repl"] = false,
      },
    },
    keys = {
      -- toggles server (normal mode)
      {
        "<C-S-A>",
        function()
          ToggleCodeium({ scope = "global" })
        end,
        mode = "n",
        desc = "Toggle Codeium",
      },
      -- toggles completion (insert mode)
      {
        "<C-S-A>",
        function()
          ToggleCodeium({ scope = "buffer" })
        end,
        mode = "i",
        desc = "Toggle Codeium",
      },
      {
        "<C-CR>",
        function()
          require("neocodeium").accept()
        end,
        mode = { "i" },
      },
      {
        "<C-n>",
        function()
          require("neocodeium").cycle_or_complete()
        end,
        mode = "i",
      },
      {
        "<C-p>",
        function()
          require("neocodeium").cycle_or_complete(1)
        end,
        mode = "i",
      },
    },
    dependencies = {
      {
        -- make ghost text show AI when neocodeium is loaded, else regular completions.
        "saghen/blink.cmp",
        opts = {
          completion = {
            ghost_text = {
              enabled = function()
                if package.loaded["neocodeium"] and require("neocodeium").visible() then
                  local plugin, _ = require("neocodeium").get_status()
                  return plugin ~= 0
                end
                return true
              end,
            },
          },
          keymap = {
            ["<C-CR>"] = {
              function()
                if package.loaded["neocodeium"] and require("neocodeium").visible() then
                  require("neocodeium").accept()
                  return true
                end
              end,
              "select_and_accept",
              "fallback",
            }, -- for accepting from blink
          },
        },
      },
      {
        "nvim-lualine/lualine.nvim",
        event = "LazyFile",
        opts = function(_, opts)
          if vim.g.lualine_ai_status then
            table.insert(opts.sections.lualine_c, 2, {
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
                }
                ---@diagnostic disable-next-line: unused-local
                if package.loaded["neocodeium"] then
                  local status, _ = require("lualine_require").require("neocodeium").get_status()
                  return symbols.status[status] -- .. symbols.server_status[server_status]
                else
                  return symbols.status[1] -- default to disabled icon when plugin hasn't loaded yet
                end
              end,
              color = function()
                return { fg = Snacks.util.color("Special") }
              end,
              padding = { right = 1 },
            })
          end
        end,
      },
    },
  },
}
