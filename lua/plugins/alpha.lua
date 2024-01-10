return {
  -- this is my startup/home screen
  -- configuration to add custom buttons, icons, neovim logo, and startup count
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    -- local logo = [[
    --         ████ ██████           █████      ██
    --        ███████████             █████ 
    --        █████████ ███████████████████ ███   ███████████
    --       █████████  ███    █████████████ █████ ██████████████
    --      █████████ ██████████ █████████ █████ █████ ████ █████
    --    ███████████ ███    ███ █████████ █████ █████ ████ █████
    --   ██████  █████████████████████ ████ █████ █████ ████ ██████
    --
    --
    --
    --   ]]
    --     local logo = [[
    --                            _
    --                           (_)
    --  _ __    ___   ___ __   __ _  _ __ ___
    -- | '_ \  / _ \ / _ \\ \ / /| || '_ ` _ \
    -- | | | ||  __/| (_) |\ V / | || | | | | |
    -- |_| |_| \___| \___/  \_/  |_||_| |_| |_|
    --
    --
    --
    --
    --     ]]

    --     local logo = [[
    --
    --
    --
    --
    --
    --           (        )   (      )
    --   (      ))\  (   /((  )\    (
    --   )\ )  /((_) )\ (_))\((_)   )\  '
    --  _(_/( (_))  ((_)_)((_)(_) _((_))
    -- | ' \))/ -_)/ _ \\ V / | || '  \()
    -- |_||_| \___|\___/ \_/  |_||_|_|_|
    --
    --
    --
    --
    --
    --     ]]

    local logo = [[
      ___           ___           ___                                    ___     
     /__/\         /  /\         /  /\          ___        ___          /__/\    
     \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   
      \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  
  _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ 
 /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\
 \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/
  \  \:\  ~~~   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      
   \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     
    \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    
     \__\/         \__\/         \__\/           ~~~~                   \__\/    
    ]]
    dashboard.section.header.val = vim.split(logo, "\n")
      -- stylua: ignore
      dashboard.section.buttons.val = {

        -- i dont rly use this either
        -- dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        -- dashboard.button("f", "🔍 " .. "Find file", ":Telescope find_files <CR>"),

        -- dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("r", "⌛ " .. "Recent files", ":Telescope oldfiles <CR>"),

        -- dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),

        -- dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
        -- dashboard.button("n", "📄 " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),

        -- i dont use this
        -- dashboard.button("e", "📂 " .. "Explore", '<cmd>lua require("mini.files").open()<cr>'),

        -- dashboard.button("h", "󰗶 " .. " Get Healthy", ":checkhealth <CR>"),
        -- dashboard.button("h", "󰗶 " .. " Get Healthy", ":checkhealth <CR>"),

        -- dashboard.button("s", " " .. " Restore Session", ":lua require('persistence').load()<CR>"),
        -- dashboard.button("s", "➿ " .. "Session Restore", ":lua require('persistence').load()<CR>"),
        dashboard.button("s", "➰ " .. "Session Restore", ":lua require('persistence').load()<CR>"),

        -- dashboard.button("c", " " .. " Config", '<CMD>lua require("lazyvim.util").telescope.config_files()()<CR>'),
        dashboard.button("c", "🔧 " .. "Config", '<CMD>lua require("lazyvim.util").telescope.config_files()()<CR>'),

        -- dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("l", "💤 " .. "Lazy", ":Lazy<CR>"),

        -- dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        dashboard.button("q", "👋 " .. "Quit", ":qa<CR>"),
      }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        -- subtract catppuccin and tokyonight (I CANT REMOVE THEM) (shhhhhh i have 69 plugins trust)
        -- sike add back tokynight its loaded properly
        -- SIKE I ACTUALLY HAVE 69 NO SUBTRACTING
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins"

        -- if i see the startup time on my homescreen ill keep wasting time trying to lower it...
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        -- dashboard.section.footer.val = "⚡ Neovim loaded "
        --   .. stats.loaded
        --   .. "/"
        --   .. stats.count
        --   .. " plugins in "
        --   .. ms
        --   .. "ms"
        -- dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        -- dashboard.section.footer.val = "⚡ Neovim loaded in " .. ms .. "ms"
        -- dashboard.section.footer.val = "⚡ Neovim loaded in " .. 0 .. " ms"
        -- dashboard.section.footer.val = "\n⚡ Neovim loaded 10 years faster than vscode"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
    vim.keymap.set("n", "<leader>A", [[:Alpha<CR>]], { silent = true })
  end,
}
