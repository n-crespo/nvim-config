return {
  "ckolkey/ts-node-action",
  event = "LazyFile",
  dependencies = { "nvim-treesitter" },
  opts = {},
  config = function()
    require("ts-node-action").setup({})
    vim.keymap.set("n", "m", function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function()
        require("ts-node-action").node_action()
      end)
      vim.fn.setpos(".", save_cursor)
    end, {
      desc = "Node Action",
    })
    vim.cmd([[echo 'keymap set']])
  end,
}
