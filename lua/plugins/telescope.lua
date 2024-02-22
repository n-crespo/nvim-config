-- fuzzy file finder and a whole lot more
-- use <leader><leader> to find within a directory
-- <leader><leader> intelligently searches root directory and respects git
-- previewer omits files that are too large or un-preview-able
local actions = require("telescope.actions")
return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    opts = {
      initial_mode = "insert",
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  },
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
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
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
    },
  },
}
