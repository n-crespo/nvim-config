return {

  { "nvimdev/dashboard-nvim", enabled = false },
  { "echasnovski/mini.starter", enabled = false },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
            ████ ██████           █████      ██
           ███████████             █████ 
           █████████ ███████████████████ ███   ███████████
          █████████  ███    █████████████ █████ ██████████████
         █████████ ██████████ █████████ █████ █████ ████ █████
       ███████████ ███    ███ █████████ █████ █████ ████ █████
      ██████  █████████████████████ ████ █████ █████ ████ ██████ ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      -- stylua: ignore
      dashboard.section.buttons.val = {

        -- dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("f", "🔍 " .. " [F]ind file", ":Telescope find_files <CR>"),

        -- dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("r", "🕐 " .. " [R]ecent files", ":Telescope oldfiles <CR>"),

        -- dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),

        -- dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
        -- dashboard.button("n", "📄 " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),

        dashboard.button("e", "📂 " .. " [E]xplore", '<cmd>lua require("mini.files").open()<cr>'),

        -- dashboard.button("c", " " .. " Config", '<CMD>lua require("lazyvim.util").telescope.config_files()()<CR>'),
        dashboard.button("c", "🔧 " .. " [C]onfig", '<CMD>lua require("lazyvim.util").telescope.config_files()()<CR>'),

        -- dashboard.button("h", "󰗶 " .. " Get Healthy", ":checkhealth <CR>"),

        -- dashboard.button("s", " " .. " Restore Session", ":lua require('persistence').load()<CR>"),
        dashboard.button("s", "➿ " .. " [S]ession Restore", ":lua require('persistence').load()<CR>"),

        -- dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("l", "💤 " .. " [L]azy", ":Lazy<CR>"),

        -- dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        dashboard.button("q", "👋 " .. " [Q]uit", ":qa<CR>"),
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
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins"
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
  },
}
