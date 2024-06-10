-- fast file system viewer, less intrusive oil.nvim
return {
  "echasnovski/mini.files",
  lazy = false,
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 30,
    },
    mappings = {
      go_in_plus = "<CR>",
    },
    options = {
      permanent_delete = false, -- files are sent to ~/.local/share/nvim/mini.files/trash/
      use_as_default_explorer = true, -- for nvim .
    },
  },
  -- open mini.files with current buffer's directory, if error is thrown fallback to cwd
  keys = function()
    -- don't center motions in mini.files
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "minifiles" },
      callback = function()
        vim.keymap.set("n", "G", "G", { buffer = true })
        vim.keymap.set("n", "<C-d>", "<C-d>", { buffer = true })
        vim.keymap.set("n", "<C-u>", "<C-u>", { buffer = true })
      end,
    })
    return {
      {
        "<leader>e",
        function()
          local success, result = pcall(function()
            return require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
          end)

          if not success then
            require("mini.files").open(vim.loop.cwd(), true)
          end
        end,
        desc = "Explore",
      },
    }
  end,
}
