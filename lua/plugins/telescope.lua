-- fuzzy file finder and a whole lot more
-- use <leader><leader> to find within a directory (respects git)
-- previewer omits files that are too large or un-preview-able, catimg for
-- images
local actions = require("telescope.actions")
return {
  dependencies = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "isak102/telescope-git-file-history.nvim",
      event = "LazyFile",
      dependencies = { "tpope/vim-fugitive" },
    },
  },
  "telescope.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {
      preview = {
        filesize_limit = 0.5, -- MB
      },
      mappings = {
        i = {
          ["<ESC>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-d>"] = actions.delete_buffer,
          ["<C-u>"] = false,
          ["<C-h>"] = function() -- for windows
            vim.cmd([[normal! bcw ]])
          end,
          ["<C-l>"] = actions.select_horizontal,
          ["<C-x>"] = false,
          ["<C-Space>"] = actions.select_tab,
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("lazyvim.util").on_load("telescope.nvim", function()
      local t = require("telescope")
      require("telescope").load_extension("git_file_history")
      vim.keymap.set("n", "<C-g>", "<cmd>Telescope git_file_history<cr>", { desc = "Git File History" })

      local z_utils = require("telescope._extensions.zoxide.utils")
      t.load_extension("zoxide")

      vim.keymap.set("n", "<leader>j", t.extensions.zoxide.list)
    end)

    -- always enter normal mode when leaving telescope prompt
    vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
      pattern = { "TelescopePrompt" },
      callback = function()
        vim.api.nvim_exec2("silent! stopinsert!", {})
      end,
    })
  end,
  keys = {
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    {
      "<leader>fo",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Find Old Files",
    },
    {
      "<leader>;",
      "<Cmd>Telescope commands<cr>",
      desc = "Commands",
      silent = true,
    },
  },
}
