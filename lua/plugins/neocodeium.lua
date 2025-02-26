-- refresh lualine whenever codeium server does something or plugin itself
-- is disabled
vim.api.nvim_create_autocmd("User", {
  pattern = { "NeoCodeiumServer*", "NeoCodeium*{En,Dis}abled" },
  callback = function()
    require("lualine").refresh()
  end,
})

-- when in insert mode, toggle completion only
function ToggleCodeiumCompletion()
  local plugin, _ = require("neocodeium").get_status()
  if plugin > 0 then -- (completion is disabled)
    vim.cmd([[NeoCodeium enable]])
    vim.notify("Codeium completion enabled", vim.log.levels.INFO, { title = "Codeium" })
  else -- (completion is enabled)
    vim.cmd([[NeoCodeium disable]]) -- disable completion
    require("neocodeium").clear()
    vim.notify("Codeium completion disabled", vim.log.levels.WARN, { title = "Codeium" })
  end
end

-- when in normal mode, keymap toggle servers
function ToggleCodeiumServer()
  local _, server = require("neocodeium").get_status()
  if server == 2 then
    vim.cmd([[NeoCodeium enable]])
    vim.notify("NeoCodeium: server started", vim.log.levels.INFO, { title = "Codeium" })
  elseif server == 0 then
    vim.cmd([[silent! NeoCodeium! disable]])
    vim.notify("NeoCodeium: server halted", vim.log.levels.WARN, { title = "Codeium" })
  end
end

-- Enables icon in statusline showing status of AI completion
vim.g.lualine_ai_status = true
return {
  {
    "monkoose/neocodeium",
    lazy = true,
    cond = not LazyVim.is_win(),
    -- enabled = false,
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
          ToggleCodeiumServer()
        end,
        mode = "n",
        desc = "Toggle Codeium",
      },
      -- toggles completion (insert mode)
      {
        "<C-S-A>",
        function()
          ToggleCodeiumCompletion()
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
      "nvim-lualine/lualine.nvim",
      event = "LazyFile",
      opts = function(_, opts)
        if vim.g.lualine_ai_status then
          table.insert(opts.sections.lualine_c, 3, {
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
              ---@diagnostic disable-next-line: unused-local
              if package.loaded["neocodeium"] then
                local status, server_status = require("lualine_require").require("neocodeium").get_status()
                return symbols.status[status] -- .. symbols.server_status[server_status]
              else
                return symbols.status[1] -- default to disabled icon when plugin hasn't loaded yet
              end
            end,
            color = function()
              return { fg = Snacks.util.color("Special") }
            end,
            padding = { left = 0 },
          })
        end
      end,
    },
  },
}
