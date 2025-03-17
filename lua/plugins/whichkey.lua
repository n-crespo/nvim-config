-- default LazyVim plugin, adds floating window for remembering keymaps
return {
  "folke/which-key.nvim",
  opts = {
    icons = { mappings = false }, -- disable icons
    filter = function(mapping)
      -- exclude mappings without a description
      return mapping.desc and mapping.desc ~= ""
    end,
    show_help = false,
    delay = function(ctx)
      return ctx.plugin and 0 or 350
    end,
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
    {
      "<leader>uS",
      nil,
      desc = "which_key_ignore",
    },
  },
}
