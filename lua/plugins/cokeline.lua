-- minimal tabline/bufferline/whatever you want to call it with sane defaults
return {
  "willothy/nvim-cokeline",
  event = "LazyFile",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
  },
  config = true,
}
