return {
  -- scrolling
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
  -- folding
  {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost", -- later or on keypress would prevent saving folds
    opts = true, -- needed even when using default config
  },
  -- exploring
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
  -- terminaling
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
  -- running
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
  -- w e b ing
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
  -- undoing
  {
    "tzachar/highlight-undo.nvim",
    opts = {
      duration = 300,
      undo = {
        hlgroup = "HighlightUndo",
        mode = "n",
        lhs = "u",
        map = "undo",
        opts = {},
      },
      redo = {
        hlgroup = "HighlightUndo",
        mode = "n",
        lhs = "<C-r>",
        map = "redo",
        opts = {},
      },
      highlight_for_count = true,
    },
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>ut", [[:UndotreeToggle <cr><c-w>h]], { silent = true, desc = "Undo [T]ree" })
    end,
  },
  -- searching
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
        -- see attempt.nvim plugin (temp files)
        require("telescope").load_extension("attempt")

        -- telescope find plugin files
        vim.keymap.set("n", "<leader>fp", function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end, { silent = true, desc = "Find [P]lugin File" })

        -- set max file size for preview
        require("telescope").setup({
          defaults = {
            initial_mode = "insert",
            preview = {
              filesize_limit = 0.1, -- MB
            },
          },
        })

        -- hide binary files in telescope preview pane
        local previewers = require("telescope.previewers")
        local Job = require("plenary.job")
        local new_maker = function(filepath, bufnr, opts)
          filepath = vim.fn.expand(filepath)
          Job:new({
            command = "file",
            args = { "--mime-type", "-b", filepath },
            on_exit = function(j)
              local mime_type = vim.split(j:result()[1], "/")[1]
              if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
              else
                -- maybe we want to write something to the buffer here
                vim.schedule(function()
                  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY FILE" })
                end)
              end
            end,
          }):sync()
        end

        require("telescope").setup({
          defaults = {
            buffer_previewer_maker = new_maker,
          },
        })
      end,
    },
  },
  -- sending things from terminal to neovim
  {
    "willothy/flatten.nvim",
    -- config = true,
    -- or pass configuration with
    opts = { window = { open = "alternate" } },
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },
  -- creating temp files
  {
    "m-demare/attempt.nvim",
    opts = function()
      require("attempt").setup({
        -- dir = (unix and "/tmp/" or vim.fn.expand("$TEMP\\")) .. "attempt.nvim" .. path_separator,
        autosave = true,
        list_buffers = false, -- This will make them show on other pickers (like :Telescope buffers)
        ext_options = { "java", "cpp", "js", "py", "c" }, -- Options to choose from
        -- format_opts = { [""] = "[None]" }, -- How they'll look
      })
    end,
    keys = function()
      local attempt = require("attempt")

      function map(mode, l, r, opts)
        opts = opts or {}
        opts = vim.tbl_extend("force", { silent = true }, opts)
        vim.keymap.set(mode, l, r, opts)
      end

      -- map("n", "<leader>an", attempt.new_select) -- new attempt, selecting extension
      map("n", "<leader>an", attempt.new_input_ext, { desc = "[n]ew" }) -- new attempt, inputing extension
      -- map("n", "<leader>ar", attempt.run) -- run attempt
      map("n", "<leader>ad", attempt.delete_buf, { desc = "[d]elete" }) -- delete attempt from current buffer
      map("n", "<leader>ar", attempt.rename_buf, { desc = "[r]ename" }) -- rename attempt from current buffer
      -- map("n", "<leader>al", "Telescope attempt") -- search through attempts
      map("n", "<leader>ap", attempt.open_select, { desc = "[p]ick" }) -- use ui.select instead of telescope
    end,
  },
}
