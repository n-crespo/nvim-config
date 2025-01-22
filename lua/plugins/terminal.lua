return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      enabled = true,
      win = { keys = { nav_l = "<C-l>", nav_j = "<C-j>", nav_k = "<C-k>" } },
    },
  },
  keys = {
    {
      "<C-q>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
    {
      "<C-S-/>",
      function()
        Snacks.terminal.toggle(vim.o.shell, {
          win = {
            position = "float",
            height = 0.8,
            width = 0.8,
            border = "rounded",
          },
        })
      end,
      desc = "Toggle Floating Terminal",
      mode = { "n", "t" },
    },
    {
      "<C-S-Q>",
      function()
        Snacks.terminal.toggle(vim.o.shell, {
          win = {
            relative = "editor",
            position = "float",
            height = 0.8,
            width = 0.8,
            border = "rounded",
          },
          -- cwd = vim.loop.cwd(),
        })
      end,
      desc = "Toggle Floating Terminal",
      mode = { "n", "t" },
    },
  },
}
