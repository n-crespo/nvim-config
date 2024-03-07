return {
  "ckolkey/ts-node-action",
  lazy = false,
  -- event = "VeryLazy",
  dependencies = { "nvim-treesitter" },
  opts = {},
  setup = function()
    vim.keymap.del("n", "S")
    vim.keymap.set("n", "S", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
  end,
  keys = {
    "S",
    "<cmd>lua require('ts-node-action').node_action()<cr>",
    desc = "Trigger Node Action",
  },
}
