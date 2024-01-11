return {
  -- {
  --   "echasnovski/mini.starter",
  --   enabled = true,
  --   version = false, -- wait till new 0.7.0 release to put it back on semver
  --   event = "VimEnter",
  --   opts = function()
  --     local logo = table.concat({
  --       "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
  --       "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
  --       "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
  --       "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
  --       "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
  --       "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
  --     }, "\n")
  --
  --     -- local logo = [[
  --     --
  --     -- neovim
  --     --
  --     -- ]]
  --
  --     local pad = string.rep(" ", 22)
  --     local new_section = function(name, action, section)
  --       return { name = name, action = action, section = pad .. section }
  --     end
  --
  --     local starter = require("mini.starter")
  --   --stylua: ignore
  --   local config = {
  --     evaluate_single = true,
  --     header = logo,
  --     items = {
  --         new_section("Recent files",    "Telescope oldfiles",                                     "Telescope"),
  --         new_section("Config",          "lua require('lazyvim.util').telescope.config_files()()", "Config"),
  --         new_section("Lazy",            "Lazy",                                                   "Config"),
  --         new_section("Session restore", [[lua require("persistence").load()]],                    "Session"),
  --         new_section("Quit",            "qa",                                                     "Built-in"),
  --     },
  --     content_hooks = {
  --       starter.gen_hook.adding_bullet(pad .. "░ ", false),
  --       starter.gen_hook.aligning("center", "center"),
  --     },
  --   }
  --     return config
  --   end,
  --   config = function(_, config)
  --     -- close Lazy and re-open when starter is ready
  --     if vim.o.filetype == "lazy" then
  --       vim.cmd.close()
  --       vim.api.nvim_create_autocmd("User", {
  --         pattern = "MiniStarterOpened",
  --         callback = function()
  --           require("lazy").show()
  --         end,
  --       })
  --     end
  --
  --     local starter = require("mini.starter")
  --     starter.setup(config)
  --
  --     vim.api.nvim_create_autocmd("User", {
  --       pattern = "LazyVimStarted",
  --       callback = function()
  --         local stats = require("lazy").stats()
  --         local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  --         local pad_footer = string.rep(" ", 8)
  --         starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
  --         pcall(starter.refresh)
  --       end,
  --     })
  --   end,
  -- },
  {
    "echasnovski/mini.starter",
    enabled = true,
    version = false,
    config = function()
      require("mini.starter").setup(
        -- No need to copy this inside `setup()`. Will be used automatically.
        {
          -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
          -- started with intent to show something else.
          autoopen = true,

          -- Whether to evaluate action of single active item
          evaluate_single = true,

          -- Items to be displayed. Should be an array with the following elements:
          -- - Item: table with <action>, <name>, and <section> keys.
          -- - Function: should return one of these three categories.
          -- - Array: elements of these three types (i.e. item, array, function).
          -- If `nil` (default), default items will be used (see |mini.starter|).

          items = {
            { name = "Recent files", action = "Telescope oldfiles", section = "Telescope" },
            { name = "Config", action = "lua require('lazyvim.util').telescope.config_files()()", section = "Config" },
            { name = "Lazy", action = "Lazy", section = "Config" },
            { name = "Session restore", action = [[lua require("persistence").load()]], section = "Session" },
            { name = "Quit", action = "qa", section = "Built-in" },
          },

          -- Header to be displayed before items. Converted to single string via
          -- `tostring` (use `\n` to display several lines). If function, it is
          -- evaluated first. If `nil` (default), polite greeting will be used.
          -- header = [[
          --       ___           ___           ___                                    ___
          --      /__/\         /  /\         /  /\          ___        ___          /__/\
          --      \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\
          --       \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\
          --   _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\
          --  /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\
          --  \  \:\``\``\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\``\__\/
          --   \  \:\  ```   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\
          --    \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\
          --     \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\
          --      \__\/         \__\/         \__\/           ````                   \__\/
          -- ]],

          -- Footer to be displayed after items. Converted to single string via
          -- `tostring` (use `\n` to display several lines). If function, it is
          -- evaluated first. If `nil` (default), default usage help will be shown.
          footer = "",

          -- Array  of functions to be applied consecutively to initial content.
          -- Each function should take and return content for 'Starter' buffer (see
          -- |mini.starter| and |MiniStarter.content| for more details).
          content_hooks = nil,

          -- Characters to update query. Each character will have special buffer
          -- mapping overriding your global ones. Be careful to not add `:` as it
          -- allows you to go into command mode.
          query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",

          -- Whether to disable showing non-error feedback
          silent = true,
        }
      )
    end,
  },
}
