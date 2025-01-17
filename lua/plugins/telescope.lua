-- fuzzy file finder and a whole lot more
-- use <leader><leader> to find within a directory (respects git)
-- shows file name before path

-- this is for showing file name before path
vim.g.lazyvim_picker = "telescope"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})
local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

-- always enter normal mode when leaving telescope prompt
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  pattern = { "TelescopePrompt" },
  callback = function()
    vim.api.nvim_exec2("silent! stopinsert!", {})
  end,
})

return {
  "telescope.nvim",
  event = "VeryLazy",
  opts = {
    pickers = {
      oldfiles = { path_display = filenameFirst },
      find_files = { path_display = filenameFirst },
      custom_grep = { path_display = filenameFirst },
      git_files = { path_display = filenameFirst },
      live_grep = {
        layout_strategy = "vertical",
      },
    },
    defaults = {
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        height = 0.9,
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      preview = { filesize_limit = 0.5 }, -- this is in MB
      border = {},
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      mappings = {
        i = {
          ["<ESC>"] = require("telescope.actions").close, -- don't enter normal mode
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-d>"] = function(prompt_bufnr)
            local _, _ = pcall(require("telescope.actions").delete_buffer, prompt_bufnr)
          end,
          ["<C-u>"] = false,
          ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
          ["<C-h>"] = function() -- for windows
            vim.cmd([[normal! bcw ]])
          end,
          ["<C-l>"] = require("telescope.actions").select_horizontal,
          ["<C-x>"] = false,
          ["<C-Space>"] = require("telescope.actions").select_tab,
          ["<Tab>"] = function(prompt_bufnr) -- focus previewer
            local action_state = require("telescope.actions.state")
            local picker = action_state.get_current_picker(prompt_bufnr)
            local prompt_win = picker.prompt_win
            local previewer = picker.previewer
            local winid = previewer.state.winid
            local bufnr = previewer.state.bufnr
            vim.keymap.set("n", "<Tab>", function()
              vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
            end, { buffer = bufnr })
            vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
            vim.keymap.set({ "n", "v", "o" }, "E", "$", { desc = "End of line", silent = true, buffer = true })
            vim.keymap.set({ "n", "v", "o" }, "B", "0", { desc = "Start of line", silent = true, buffer = true })
          end,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        -- override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  },
  keys = {
    { "<leader>sb", false },
    { "<leader>sg", false },
    { "<leader>sa", false },
    { "<leader>sc", false },
    { "<leader>sm", false },
    { '<leader>s"', false },
    { "<leader>sq", false },
    { "<leader>sG", false },
    { "<leader>fb", false },
    { "<leader>sl", false },
    { "<leader>fg", false },
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>sC", false },
    { "<leader>fF", false },
    {
      "<leader>fh",
      LazyVim.pick("files"),
      desc = "Find Files (Here)",
    },
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files({ prompt_title = "Find Files (cwd)" })
      end,
      desc = "Find Files in CWD",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({ prompt_title = "Find Files (cwd)" })
      end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>fw",
      require("telescope.builtin").live_grep,
      desc = "Find Word (cwd)",
    },
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
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
      silent = true,
    },
    {
      "<leader>gf",
      function()
        require("telescope.builtin").git_bcommits({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Git File History",
      silent = true,
    },
    {
      "<leader>gs",
      function()
        pcall(function()
          require("telescope.builtin").git_status({ cwd = vim.fn.expand("%:p:h") })
        end)
      end,
      desc = "Git Status",
      silent = true,
    },
    {
      "<leader>R",
      function()
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        pickers
          .new(opts, {
            prompt_title = "Plugins",
            finder = finders.new_table({
              results = require("custom.utils").pluginNames(),
            }),
            sorter = conf.generic_sorter(opts),

            attach_mappings = function(prompt_bufnr, _)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd("Lazy reload " .. selection[1])
              end)
              return true
            end,
          })
          :find()
      end,
      desc = "Reload Plugin",
    },
  },
}
