return {
  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")

        -- telescope find plugin files
        vim.keymap.set("n", "<leader>fp", function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end, { silent = true, desc = "Find [P]lugin File" })
      end,
    },
  },
}
