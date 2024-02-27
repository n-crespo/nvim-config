return {
  "ckolkey/ts-node-action",
  event = "LazyFile",
  dependencies = { "nvim-treesitter" },
  opts = {},
  config = function()
    vim.keymap.set({ "n" }, "S", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
  end,
}
