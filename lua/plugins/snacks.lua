vim.g.snacks_animate = false
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    styles = {
      blame_line = { border = "single" },
      terminal = { wo = { winbar = "" } },
      notification_history = { border = "single" },
      notification = { winblend = 100 },
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    dashboard = {
      width = 45,
      preset = {
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
          { icon = " ", key = "s", desc = "Restore Session", section = "session", enabled = not LazyVim.is_win() },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = ([[
          ┌─────┐┌─────┐┌─────┐┌──┐──┐┌──┐┌────────┐
          │  .  ││  .__││  .  ││  │  ││  ││  .  .  │
          └──┘──┘└─────┘└─────┘ '───' └──┘└──┘──┘──┘
        ]]):gsub("^%s+", ""):gsub("\n%s+", "\n"),
      },
      sections = {
        { section = "header", padding = 1 },
        { section = "keys", gap = 1, padding = 1 },
        -- { section = "startup" },
      },
    },
    notification = { sort = { "added" } },
    words = {
      enabled = true,
      modes = { "n" },
    },
    animate = { enabled = false, easing = "linear", fps = 120 },
    input = { enabled = true },
    terminal = {
      enabled = true,
      win = { keys = { nav_l = "<C-l>", nav_j = "<C-j>", nav_k = "<C-k>" } },
    },
    rename = { enabled = true },
    scratch = { enabled = false },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = {
      enabled = true,
      indent = { enabled = true },
      scope = { enabled = true },
      animate = { enabled = false },
    },
    zen = {
      enabled = true,
      toggles = {
        dim = false,
      },
    },
    debug = {
      enabled = false,
    },
    profiler = {
      enabled = false,
      autocmds = false,
      startup = {
        event = "",
      },
    },
    picker = {
      ---@class snacks.picker.formatters.Config
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
        },
      },
      ---@class snacks.picker.previewers.Config
      previewers = {
        file = {
          max_size = 1024 * 1024, -- 1MB
          max_line_length = 500, -- max line length
          ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
        },
        man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
      },
      ---@class snacks.picker.jump.Config
      jump = {
        jumplist = true, -- save the current position in the jumplist
        tagstack = false, -- save the current position in the tagstack
        reuse_win = false, -- reuse an existing window if the buffer is already open
      },
      win = {
        -- input window
        input = {
          keys = {
            -- learn
            ["<C-Up>"] = { "history_back", mode = { "i", "n" } },
            ["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
            -- custom
            ["<C-e>"] = "toggle_help", -- doesn't work
            ["<a-o>"] = { "toggle_maximize", mode = { "i", "n" } },
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<S-Tab>"] = { "", mode = { "i", "n" } },
            ["<Tab>"] = { "cycle_win", mode = { "i", "n" } },
            ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
            -- TODO: get <C-d> to close buffer in <leader>,
            ["<c-d>"] = { "buffer_close", mode = { "i", "n" } },
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-l>"] = { "edit_split", mode = { "i", "n" } },
            ["<c-space>"] = { "edit_tab", mode = { "i", "n" } },

            -- what does this do??
            ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
            ["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },

            -- remap to something else?
            ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
            ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
          },
          b = {
            minipairs_disable = true,
          },
        },
        -- preview window
        preview = {
          keys = {
            ["<Tab>"] = { "focus_input", mode = { "i", "n" } },
            ["<Esc>"] = "close",
          },
        },
      },
    },
  },
  keys = {
    { "<leader>dph", false, desc = "which_key_ignore", hidden = true },
    { "<leader>dps", false, desc = "which_key_ignore", hidden = true },
    { "<leader>dpp", false, desc = "which_key_ignore", hidden = true },
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
            border = "single",
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
            border = "single",
          },
          -- cwd = vim.loop.cwd(),
        })
      end,
      desc = "Toggle Floating Terminal",
      mode = { "n", "t" },
    },
    -- <C-.>, <C-S-/>
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>A",
      function()
        Snacks.dashboard.open()
      end,
      desc = "Open Dashboard",
    },
    ----------- PICKER KEYMAPS -------------
    { "<leader>gc", false },
    { "<leader>sg", false },
    { "<leader>fb", false },
    { "<leader>fr", false },
    { "<leader>ff", false },
    { "<leader>sc", false },
    { "<leader>sC", false },
    { "<leader>sl", false },
    { "<leader>qp", false },
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fh",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files (Here) (Root)",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- Grep
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>;",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>j",
      function()
        Snacks.picker.projects()
      end,
      desc = "Jump to Project",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
  },
}
