-- fuzzy file finder and a whole lot more
-- use <leader><leader> to find within a directory (respects git)
-- previewer omits files that are too large or un-preview-able, catimg for
-- images
local actions = require("telescope.actions")
return {
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
    -- vim.keymap.set("n", "<leader>;", "<cmd>Telescope commands<cr>", { silent = true, desc = "Commands" })
    {
      "<leader>;",
      "<Cmd>Telescope commands<cr>",
      desc = "Commands",
      silent = true,
    },
    -- { -- unholy nonnative vim keybind
    --   "<C-o>",
    --   function()
    --     local theme = require("telescope.themes").get_ivy()
    --     -- theme["find_command"] = opts.find_command
    --     theme["layout_config"]["height"] = 19
    --     require("telescope.builtin").find_files(theme)
    --     -- require("telescope.builtin").find_files(require("telescope.themes").get_ivy())
    --   end,
    --   silent = true,
    --   desc = "Find Files",
    -- },
    -- {
    --   "<C-f>",
    --   function()
    --     require("telescope.builtin").current_buffer_fuzzy_find(
    --       require("telescope.themes").get_dropdown({ winblend = 0, previewer = false })
    --     )
    --   end,
    --   desc = "Find Word",
    -- },
  },
}
