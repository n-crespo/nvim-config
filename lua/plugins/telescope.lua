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
          ["<esc>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<c-d>"] = actions.delete_buffer,
          ["<c-n>"] = actions.select_tab,
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("lazyvim.util").on_load("telescope.nvim", function()
      require("telescope").load_extension("git_file_history")
      vim.keymap.set("n", "<C-g>", "<cmd>Telescope git_file_history<cr>", { desc = "Git File History" })
    end)
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
