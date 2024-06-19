return {
  "danielfalk/smart-open.nvim",
  enabled = vim.fn.has("win32") == 0, -- disable on windows
  -- branch = "0.2.x",
  event = "VeryLazy",
  opts = {
    show_scores = true,
    fatch_algorithm = "fzy",
  },
  config = function()
    require("telescope").load_extension("smart_open")
    vim.keymap.set("n", "<leader><space>", function()
      require("telescope").extensions.smart_open.smart_open()
    end, { desc = "Smart Open" })
  end,
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-fzy-native.nvim",
  },
}
