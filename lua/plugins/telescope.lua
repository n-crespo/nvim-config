return {
  -- fuzzy file finder and a whole lot more
  -- use <leader><leader> to find within a directory
  -- <leader><leader> intelligently searches root directory and respets git
  -- previewer omits files that are too large or un-preview-able
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")

      -- telescope find plugin files
      vim.keymap.set("n", "<leader>fp", function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end, { silent = true, desc = "Find Plugin File" })

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
}
