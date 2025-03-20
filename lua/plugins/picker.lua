return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = {
        cycle = true,
        preset = function()
          if vim.o.lines <= 23 then
            return "small"
          elseif vim.o.columns <= 130 then
            return "vertical"
          else
            return "default"
          end
        end,
      },
      layouts = {
        vscode = {
          layout = {
            preview = false,
            backdrop = false,
            row = 1,
            width = 0.4,
            min_width = 80,
            height = 0.4,
            border = "none",
            box = "vertical",
            { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
            { win = "list", border = "single" },
            { win = "preview", title = "{preview}", border = "rounded" },
          },
        },
        -- this is just vertical but without a preview
        small = {
          layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 60,
            height = 0.8,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
          },
        },
        vertical = {
          layout = {
            box = "vertical",
            width = 0.8,
            min_width = 40,
            height = 0.8,
            min_height = 20,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", height = 0.4, border = "rounded" },
          },
        },
        default = {
          layout = {
            box = "horizontal",
            width = 0.85,
            min_width = 85,
            height = 0.8,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
          },
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
            ["<Tab>"] = { "cycle_win", mode = { "i", "n" } },
            ["<S-CR>"] = { "edit_tab", mode = { "i", "n" } },
            ["<C-a>"] = { "", mode = { "i", "n" } },
            ["<C-p>"] = { "history_back", mode = { "i", "n" } },
            ["<C-n>"] = { "history_forward", mode = { "i", "n" } },
            ["<c-s-/>"] = { "toggle_help", mode = { "i", "n" } },
            ["<a-o>"] = { "toggle_maximize", mode = { "i", "n" } },
            ["<c-l>"] = { "layout_default", mode = { "i", "n" } },
            ["<c-t>"] = { "trouble_open", mode = { "i", "n" } },
            ["<Esc>"] = { "cancel", mode = { "n", "i" } },
            ["<S-Tab>"] = { "cycle_win", mode = { "i", "n" } },
            ["<C-Space>"] = { "toggle_live", mode = { "i", "n" } },
            ["<c-s>"] = { "edit_split", mode = { "i", "n" } },

            -- scrolling
            ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },

            -- what does this do??
            ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
            ["<a-y>"] = { "toggle_follow", mode = { "i", "n" } },

            -- remap to something else?
            ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
            ["<a-u>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
          },
          b = {
            minipairs_disable = true,
          },
        },
        list = {
          keys = {
            ["<Tab>"] = { "focus_input", mode = { "i", "n" } },
            ["<S-Tab>"] = { "", mode = { "i", "n" } },
          },
        },
        -- preview window
        preview = {
          keys = {
            ["<a-o>"] = { "toggle_maximize", mode = { "i", "n" } },
            ["<S-Tab>"] = { "focus_input" },
            ["<Tab>"] = { "focus_input" },
            ["<Esc>"] = "close",
            ["i"] = "focus_input",
          },
        },
      },
    },
  },
  keys = {
    ----------- PICKER KEYMAPS -------------
    { "<leader>gc", nil },
    { "<leader>sg", nil },
    { "<leader>fb", nil },
    { "<leader>fB", nil },
    { "<leader>fr", nil },
    { "<leader>ff", nil },
    { "<leader>sc", nil },
    { "<leader>sq", nil }, -- quickfix list
    { "<leader>sC", nil },
    { "<leader>sG", nil },
    { "<leader>sl", nil },
    { '<leader>s"', nil },
    { "<leader>qp", nil },
    { "<leader>sB", nil },
    { "<leader>fF", nil },
    { "<leader>fg", nil },
    { "<leader>fR", nil },
    { "<leader>sw", nil },
    { "<leader>sW", nil },
    { "<leader>sM", nil },
    { "<leader>sm", nil },
    { "<leader>sb", nil },
    { "<leader>sj", nil },
    {
      "<leader>fP",
      function()
        Snacks.picker.pickers()
      end,
      desc = "Pickers",
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent (dumb)",
    },
    {
      "<leader>F",
      function()
        Snacks.picker.smart()
      end,
      desc = "Find a File (smart)",
    },
    {
      "<leader>fw",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.grep({ cwd = require("custom.utils").get_dir_with_fallback() })
      end,
      desc = "Grep (buffer dir)",
    },
    {
      "<leader><leader>",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.files({ cwd = require("custom.utils").get_dir_with_fallback() })
      end,
      desc = "Find Files (buffer dir)",
    },
    {
      "<leader>fh",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.picker.files({ cwd = LazyVim.root.get({ normalize = true, hidden = true, ignored = true }) })
      end,
      desc = "Files Here (root)",
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
      "<leader>;",
      function()
        Snacks.picker.commands({ layout = "vscode" })
      end,
      desc = "Commands",
    },
    {
      "<leader>j",
      function()
        if vim.fn.executable("zoxide") == 1 then
          Snacks.picker.zoxide()
        else
          vim.notify("Zoxide is not installed", vim.log.levels.WARN)
        end
      end,
      desc = "Jump to Project",
    },
    {
      "<leader>st",
      function()
        ---@diagnostic disable-next-line: undefined-field
        Snacks.picker.todo_comments({ cwd = require("custom.utils").get_dir_with_fallback() })
      end,
      desc = "Todo",
    },
    {
      "<leader>sT",
      function()
        ---@diagnostic disable-next-line: undefined-field
        Snacks.picker.todo_comments({
          keywords = { "TODO", "FIX", "FIXME" },
          cwd = require("custom.utils").get_dir_with_fallback(),
        })
      end,
      desc = "Todo/Fix/Fixme",
    },
    {
      "<S-Tab>",
      "<C-w><C-p>", -- this fixes <tab> in preview window
    },
  },
}
