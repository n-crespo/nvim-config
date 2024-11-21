return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    dashboard = {
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        keys = {
          { icon = " ", key = "e", desc = "Explore", action = "<leader>e" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "o", desc = "Old Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        -- Used by the `header` section
        --         header = [[
        -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
        -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],

        header = [[
                                  __
  ___       __     ___    __  __ /\_\     ___ ___
/' _ `\   /'__`\  / __`\ /\ \/\ \\/\ \  /' __` __`\
/\ \/\ \ /\  __/ /\ \L\ \\ \ \_/ |\ \ \ /\ \/\ \/\ \
\ \_\ \_\\ \____\\ \____/ \ \___/  \ \_\\ \_\ \_\ \_\
 \/_/\/_/ \/____/ \/___/   \/__/    \/_/ \/_/\/_/\/_/
          ]],
        -- header = "hello nicolas",
      },
      -- item field formatters
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    notifier = {
      enabled = true,
    },
    notification = {
      {
        border = "single",
        zindex = 100,
        sort = { "added" },
        ft = "markdown",
        wo = {
          winblend = 5,
          wrap = false,
          conceallevel = 2,
        },
        bo = { filetype = "snacks_notif" },
      },
      history = {
        border = "single",
      },
    },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    terminal = {
      enabled = true,
      win = {
        style = "terminal",
        winbar = "1",
      },
      wo = {
        winbar = "",
      },
      keys = {
        term_normal = {},
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)

    -- single border in <leader>m
    Snacks.config.style("notification.history", {
      border = "single",
    })
  end,
  keys = {
    {
      "<leader>m",
      function()
        Snacks.notifier.show_history({ border = "single" })
      end,
      desc = "Message History",
    },
    {
      "<C-q>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
    -- <C-.>, <C-S-/>
  },
}
