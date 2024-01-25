return {
  "echasnovski/mini.starter",
  enabled = true,
  version = false,
  config = function()
    -- Mini starter
    local status, starter = pcall(require, "mini.starter")
    if not status then
      return
    end

    starter.setup({
      content_hooks = {
        -- starter.gen_hook.adding_bullet("                                        ░ "),
        starter.gen_hook.adding_bullet("░ "),
        starter.gen_hook.aligning("center", "center"),
      },
      evaluate_single = true,
      silent = true,
      autoopen = true,
      -- footer = "                                " .. os.date("%A, %B %d, %Y %I:%M %p"),
      footer = os.date("%A, %B %d, %Y %I:%M %p"),
      -- footer = os.date(),

      -- header = table.concat({
      --   [[              ___           ___           ___                                    ___          ]],
      --   [[             /__/\         /  /\         /  /\          ___        ___          /__/\         ]],
      --   [[             \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\        ]],
      --   [[              \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\       ]],
      --   [[          _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\      ]],
      --   [[         /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\     ]],
      --   [[         \  \:\``\``\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\``\__\/     ]],
      --   [[          \  \:\  ```   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\           ]],
      --   [[           \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\          ]],
      --   [[            \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\         ]],
      --   [[             \__\/         \__\/         \__\/           ````                   \__\/         ]],
      -- }, "\n"),

      header = table.concat({
        [[  /\ \▔\___  ___/\   /()_ __ ___  ]],
        [[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
        [[/ /\  /  __/ (_) \ V /| | | | | | |]],
        [[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
        [[───────────────────────────────────]],
      }, "\n"),

      query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
      items = {
        {
          name = "Explore",
          action = "lua require('mini.files').open(vim.loop.cwd(), true)",
          section = " ",
        },
        { name = "Recent files", action = "Telescope oldfiles", section = " " },
        {
          name = "Config files",
          action = "lua require('lazyvim.util').telescope.config_files()()",
          section = " ",
        },
        { name = "Session restore", action = [[lua require("persistence").load()]], section = " " },
        { name = "Lazy", action = "Lazy", section = " " },
        { name = "Quit", action = "qa", section = " " },
      },
    })

    vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
    au User MiniStarterOpened nmap <buffer> <C-p> <leader><leader>
    " au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>Telescope file_browser<CR>
  augroup END
]])
    -- require("mini.starter").setup(
    --   -- No need to copy this inside `setup()`. Will be used automatically.
    --   {
    --     -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
    --     -- started with intent to show something else.
    --     autoopen = true,
    --
    --     -- Whether to evaluate action of single active item
    --     evaluate_single = true,
    --
    --     -- Items to be displayed. Should be an array with the following elements:
    --     -- - Item: table with <action>, <name>, and <section> keys.
    --     -- - Function: should return one of these three categories.
    --     -- - Array: elements of these three types (i.e. item, array, function).
    --     -- If `nil` (default), default items will be used (see |mini.starter|).
    --
    --     items = {
    --       {
    --         name = "Explore",
    --         action = "lua require('mini.files').open(vim.loop.cwd(), true)",
    --         section = "Find",
    --       },
    --       { name = "Recent files", action = "Telescope oldfiles", section = "Find" },
    --       { name = "Lazy", action = "Lazy", section = "Config" },
    --       {
    --         name = "Config files",
    --         action = "lua require('lazyvim.util').telescope.config_files()()",
    --         section = "Config",
    --       },
    --       { name = "Session restore", action = [[lua require("persistence").load()]], section = "Session" },
    --       { name = "Quit", action = "qa", section = "Built-in" },
    --     },
    --
    --     -- Header to be displayed before items. Converted to single string via
    --     -- `tostring` (use `\n` to display several lines). If function, it is
    --     -- evaluated first. If `nil` (default), polite greeting will be used.
    --     -- header = [[
    --     --       ___           ___           ___                                    ___
    --     --      /__/\         /  /\         /  /\          ___        ___          /__/\
    --     --      \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\
    --     --       \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\
    --     --   _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\
    --     --  /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\
    --     --  \  \:\``\``\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\``\__\/
    --     --   \  \:\  ```   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\
    --     --    \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\
    --     --     \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\
    --     --      \__\/         \__\/         \__\/           ````                   \__\/
    --     -- ]],
    --
    --     -- Footer to be displayed after items. Converted to single string via
    --     -- `tostring` (use `\n` to display several lines). If function, it is
    --     -- evaluated first. If `nil` (default), default usage help will be shown.
    --     -- footer = "",
    --
    --     -- Array  of functions to be applied consecutively to initial content.
    --     -- Each function should take and return content for 'Starter' buffer (see
    --     -- |mini.starter| and |MiniStarter.content| for more details).
    --     content_hooks = nil,
    --
    --     -- Characters to update query. Each character will have special buffer
    --     -- mapping overriding your global ones. Be careful to not add `:` as it
    --     -- allows you to go into command mode.
    --     query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
    --
    --     -- Whether to disable showing non-error feedback
    --     silent = true,
    --   }
    -- )
  end,
}
