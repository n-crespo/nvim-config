-- default LazyVim plugin, adds floating window for remembering keymaps
return {
  "folke/which-key.nvim",
  lazy = false,
  opts = {
    preset = "modern",
    filter = function(mapping)
      -- exclude mappings without a description
      return mapping.desc and mapping.desc ~= ""
    end,
    show_help = false,
    plugins = {
      marks = false,
      spelling = {
        enabled = false,
      },
    },
    win = {
      no_overlap = false,
      border = "rounded",
      padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    },
    spec = {
      mode = { "n", "v" },
      -- { "<leader>t", group = "+tab" },
      { "<R>", group = "run", icon = "" },
      { "<leader>dph", hidden = true },
      { "<leader>dpp", hidden = true },
      { "<leader>d", proxy = false },
    },
  },
  keys = {
    { "<leader>K", nil },
    { "<leader><Tab><Tab>", nil },
    { "<leader><Tab>]", nil },
    { "<leader><Tab>[", nil },
    { "<leader><Tab>f", nil },
    { "<leader><Tab>l", nil },
    { "<leader><Tab>l", nil },
    { "<leader>-", nil },
    { "<leader>w-", nil },
    { "<leader>w|", nil },
    { "<leader>|", nil },
    { "<leader>bb", nil },
    { "<leader>bD", nil },
    { "<leader>ft", nil },
    { "<leader>fT", nil },
    { "<leader>qq", nil },
  },
}
