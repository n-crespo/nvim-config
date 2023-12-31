return {
  -- buffers
  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = {
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    },
    keys = {
      { "<C-p>", "<cmd>BufferLinePick<cr>", desc = "[P]ick Buffer" },
    },
  },
  -- notifications
  {
    "rcarriga/nvim-notify",
    -- below is needed when using transparent background
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {
        function()
          return " " .. os.date("%I:%M %p")
        end,
      }
    end,
  },
  -- indent guides (instant)
  {
    "echasnovski/mini.indentscope",
    -- version = false,  wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      exclude = {
        filetypes = { "better_term" },
      },
      -- symbol = "▏"
      symbol = "│",
      options = { try_as_border = true },
      draw = { delay = 0, animation = require("mini.indentscope").gen_animation.none() },
    },
  },
  -- homescreen
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
        dashboard.button("f", "🔍 " .. "[F]ind file", ":Telescope find_files <CR>"),

        -- dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("r", "🕐 " .. "[R]ecent files", ":Telescope oldfiles <CR>"),

        -- dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),

        -- dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
        -- dashboard.button("n", "📄 " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),

        dashboard.button("e", "📂 " .. "[E]xplore", '<cmd>lua require("mini.files").open()<cr>'),

        -- dashboard.button("h", "󰗶 " .. " Get Healthy", ":checkhealth <CR>"),

        -- dashboard.button("s", " " .. " Restore Session", ":lua require('persistence').load()<CR>"),
        dashboard.button("s", "➿ " .. "[S]ession Restore", ":lua require('persistence').load()<CR>"),

        -- dashboard.button("c", " " .. " Config", '<CMD>lua require("lazyvim.util").telescope.config_files()()<CR>'),
        dashboard.button("c", "🔧 " .. "[C]onfig", '<CMD>lua require("lazyvim.util").telescope.config_files()()<CR>'),

        -- dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("l", "💤 " .. "[L]azy", ":Lazy<CR>"),

        -- dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        dashboard.button("q", "👋 " .. "[Q]uit", ":qa<CR>"),
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
  -- better ui
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  -- keymap popups
  {
    "folke/which-key.nvim",
    opts = function()
      return {
        plugins = {
          marks = true, -- shows a list of your marks on ' and `
          registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 25, -- how many suggestions should be shown in the list?
          },
          presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
          },
        },
        defaults = {
          mode = { "n", "v" },
          ["g"] = { name = "+goto" },
          ["<Leader>b"] = { name = "+Buffer" },
          ["<Leader>c"] = { name = "+Code" },
          ["<Leader>f"] = { name = "+Find" },
          -- ["<Leader>gh"] = { name = "+Hunks" },
          ["<Leader>g"] = { name = "+Git" },
          ["<Leader>l"] = { name = "+Lazy" },
          ["<Leader>s"] = { name = "+Search" },
          -- ["<Leader><tab>"] = { name = "+Tabs" },
          ["<Leader>u"] = { name = "+UI" },
          ["<Leader>w"] = { name = "+Window" },
          ["<Leader>j"] = { name = "+Java" },
          ["<Leader>p"] = { name = "+Python" },
          ["<Leader>q"] = { name = "+Sessions" },
          ["<Leader>r"] = { name = "+Run" },
          -- ["<leader>t"] = { name = "+Table" },
          ["<Leader>R"] = { name = "+R Markdown" },
          ["<Leader>Rk"] = { name = "+R Knit" },
          ["<Leader>x"] = { name = "+Quickfix" },
          ["<Leader><Tab>"] = { name = "+Tab" },
          ["<Leader>"] = { name = "+Leader" },
          ["<Leader>sn"] = { name = "+Noice" },
          ["<Leader>gh"] = { name = "+Hunk" },
          ["<LocalLeader>"] = { name = "+Leader" },
          ["<Leader>o"] = { name = "+Open" },
          ["<Leader>mt"] = { name = "+Table" },

          ["<LocalLeader>s"] = { name = "+Search" },
          ["]"] = { name = "+next" },
          ["["] = { name = "+prev" },
        },
      }
    end,
    -- config = function(_, opts)
    --   local wk = require("which-key")
    --   wk.setup(opts)
    --   wk.register(opts.defaults)
    -- end,
  },
  -- theme
  {
    "olimorris/onedarkpro.nvim",
    name = "onedarkpro",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        styles = { -- For example, to apply bold and italic, use "bold,italic"
          comments = "italic", -- Style that is applied to comments
          virtual_text = "bold", -- Style that is applied to virtual text
        },
        options = {
          cursorline = false, -- Use cursorline highlighting?
          transparency = true, -- Use a transparent background?
          terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
          highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
          bold = false,
          italic = false,
          underline = true,
          undercurl = true,
        },
      })
      vim.cmd.colorscheme("onedark_dark")
    end,
  },
}
