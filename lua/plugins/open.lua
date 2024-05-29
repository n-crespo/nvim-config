return {
  "danielfalk/smart-open.nvim",
  -- branch = "0.2.x",
  event = "VeryLazy",
  opts = {
    show_scores = true,
    fatch_algorithm = "fzy",
  },
  config = function()
    require("telescope").load_extension("smart_open")
  end,
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-fzy-native.nvim",
  },
}
