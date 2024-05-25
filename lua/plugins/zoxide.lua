return {
  "jvgrootveld/telescope-zoxide",
  event = "LazyFile",
  config = function()
    local t = require("telescope")
    local z_utils = require("telescope._extensions.zoxide.utils")
    t.load_extension("zoxide")
    vim.keymap.set("n", "<leader>j", t.extensions.zoxide.list)
  end,
}
