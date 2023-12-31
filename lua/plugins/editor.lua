return {

  {
    "Aasim-A/scrollEOF.nvim",
    config = function()
      require("scrollEOF").setup({
        -- The pattern used for the internal autocmd to determine
        -- where to run scrollEOF. See https://neovim.io/doc/user/autocmd.html#autocmd-pattern
        pattern = "*",
        -- Whether or not scrollEOF should be enabled in insert mode
        insert_mode = false,
        -- List of filetypes to disable scrollEOF for.
        disabled_filetypes = { "minifiles" },
        -- List of modes to disable scrollEOF for. see https://neovim.io/doc/user/builtin.html#mode() for available modes.
        disabled_modes = {},
      })
    end,
  },
  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        permanent_delete = false,
        -- Whether to use for editing directories
        -- Disabled by default in LazyVim because neo-tree is used for that
        use_as_default_explorer = true,
      },
    },
    keys = {
      -- {
      --   "<leader>fm",
      --   function()
      --     require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      --   end,
      --   desc = "Open mini.files (directory of current file)",
      -- },
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "[e]xplore",
      },
      -- below is unneeded due to autochdir option (see ../config/options.lua)
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "[E]xplore!",
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      ---@diagnostic disable-next-line: unused-local
      local filter_show = function(fs_entry)
        return true
      end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, ".")
      end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh({ content = { filter = new_filter } })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesActionRename",
        callback = function(event)
          require("lazyvim.util").lsp.on_rename(event.data.from, event.data.to)
        end,
      })
    end,
  },
  {
    "CRAG666/betterTerm.nvim",
    opts = function()
      ---@diagnostic disable-next-line: missing-fields
      require("betterTerm").setup({
        prefix = "terminal-",
      })
      local betterTerm = require("betterTerm")
      vim.keymap.set({ "n", "t" }, "<C-q>", betterTerm.open, { desc = "Open terminal" })
      -- only ever going to use one of these...
      -- vim.keymap.set({ "n", "t" }, "<C-p>", betterTerm.select, { desc = "Open terminal" })
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    config = true,
    opts = function()
      vim.keymap.set("n", "<leader>r", "<cmd>RunCode<cr>", { desc = "Run Code", silent = true })
      require("code_runner").setup({
        mode = "term",
        startinsert = true,
        filetype = {
          python = "python3 -u",
        },
      })
    end,
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { -- example for lazy-loading and keymap
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
    },
  },
}
