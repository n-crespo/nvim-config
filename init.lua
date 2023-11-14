require("config.lazy")

require("onedarkpro").setup({
  colors = {
    dark = {
      bg = "#101010",
      virtual_text_warning = "#f59166",
    }, -- yellow
  },
  highlights = {
    Error = {
      bg = "#FF0000",
      fg = "#FF0000",
    },
  },
})
vim.cmd("color onedark_dark")
