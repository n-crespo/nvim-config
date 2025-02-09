-- default LazyVim plugin, adds floating window for remembering keymaps
return {
  "folke/which-key.nvim",
  opts = {
    preset = "helix",
    filter = function(mapping)
      -- exclude mappings without a description
      return mapping.desc and mapping.desc ~= ""
    end,
    triggers = {
      { "<auto>", mode = "nso" },
    },
    show_help = true,
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
      {
        mode = { "n", "v" },
        { "<R>", group = "run", icon = "" },
        { "<leader>q", group = "Close Window" },
        -- i forced this mapping to be  hidden because it hides disabled snacks
        -- profiler keymaps like <leader>dpp (damn you Snacks.map())
        { "<leader>d", group = "Delete and Copy", proxy = false, hidden = true },
      },
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
    { "<leader>d", '"+d', desc = "Cut", silent = true, remap = false, mode = "v" },
    { "<leader>d", '"+dd', desc = "Cut", silent = true, mode = "n" },
  },
}
