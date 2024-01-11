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

    local logo = [[
      ___           ___           ___                                    ___
     /__/\         /  /\         /  /\          ___        ___          /__/\
     \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\
      \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\
  _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\
 /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\
 \  \:\``\``\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\``\__\/
  \  \:\  ```   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\
   \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\
    \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\
     \__\/         \__\/         \__\/           ````                   \__\/
    ]]
    dashboard.section.header.val = vim.split(logo, "\n")
      -- stylua: ignore
      dashboard.section.buttons.val = {
        -- dashboard.button("r", "⌛ " .. "Recent files", ":Telescope oldfiles <CR>"),
        -- dashboard.button("s", "➰ " .. "Session Restore", ":lua require('persistence').load()<CR>"),
        -- dashboard.button("c", "🔧 " .. "Config", '<CMD>lua require("lazyvim.util").telescope.config_files()()<CR>'),
        -- dashboard.button("l", "💤 " .. "Lazy", ":Lazy<CR>"),
        -- dashboard.button("q", "👋 " .. "Quit", ":qa<CR>"),

        dashboard.button("r", "   " .. "Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("s", "   " .. "Session Restore", ":lua require('persistence').load()<CR>"),
        dashboard.button("c", "   " .. "Config", '<CMD>lua require("lazyvim.util").telescope.config_files()()<CR>'),
        dashboard.button("l", "   " .. "Lazy", ":Lazy<CR>"),
        dashboard.button("q", "   " .. "Quit", ":qa<CR>"),
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
        dashboard.section.footer.val = "Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins"
        -- dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins"

        -- if i see the startup time on my homescreen ill keep wasting time trying to lower it...
        -- local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        -- dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
        -- dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        -- dashboard.section.footer.val = "⚡ Neovim loaded in " .. ms .. "ms"

        pcall(vim.cmd.AlphaRedraw)
      end,
    })
    vim.keymap.set("n", "<leader>A", [[:Alpha<CR>]], { silent = true })
  end,
}
