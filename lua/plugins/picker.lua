return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = {
        box = {
          reverse = true,
        },
      },
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
        },
      },
      win = {
        -- input window
        input = {
          keys = {
            -- custom
            ["<S-Tab>"] = { "", mode = { "i", "n" } },
            ["<C-a>"] = { "", mode = { "i", "n" } },
            ["<C-p>"] = { "history_back", mode = { "i", "n" } },
            ["<C-n>"] = { "history_forward", mode = { "i", "n" } },
            ["<C-e>"] = "toggle_help", -- doesn't work
            ["<a-o>"] = { "toggle_maximize", mode = { "i", "n" } },
            ["<Esc>"] = { "close", mode = { "n", "i" } },
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
            ["<a-y>"] = { "toggle_follow", mode = { "i", "n" } },

            -- remap to something else?
            ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
            ["<a-u>"] = { "toggle_hidden", mode = { "i", "n" } },
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
  dependencies = {
    "folke/todo-comments.nvim",
    keys = {
      {
        "<leader>st",
        function()
          Snacks.picker.todo_comments({ cwd = vim.fn.expand("%:h") })
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" }, cwd = vim.fn.expand("%:h") })
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
  keys = {
    ----------- PICKER KEYMAPS -------------
    { "<leader>gc", false },
    { "<leader>sg", false },
    { "<leader>fb", false },
    { "<leader>fr", false },
    { "<leader>ff", false },
    { "<leader>sc", false },
    { "<leader>sq", false }, -- quickfix list
    { "<leader>sC", false },
    { "<leader>sG", false },
    { "<leader>sl", false },
    { "<leader>qp", false },
    { "<leader>sB", false },
    { "<leader>fF", false },
    { "<leader>sw", false },
    { "<leader>sW", false },
    {
      "<leader><space>",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.files({ cwd = vim.fn.expand("%:h") })
      end,
      desc = "Find Files (Buffer Dir)",
    },
    {
      "<leader>fh",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.files({ cwd = LazyVim.root.get({ normalize = true }) })
      end,
      desc = "Files Here (Root)",
    },
    {
      "<leader>fp",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep({ cwd = vim.fn.expand("%:h") })
      end,
      desc = "Grep (cwd)",
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.smart()
      end,
      desc = "Recent (smart)",
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
      "<leader>;",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>j",
      function()
        Snacks.picker.zoxide()
      end,
      desc = "Jumpd to Project",
    },
  },
}
