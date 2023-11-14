require("config.lazy")

require("onedarkpro").setup({
  colors = {
    dark = {
      bg = "#101010",
    }, -- yellow
    virtual_text_warning = "#f59166",
    virtual_text_error = "#ff0000",
  },
  highlights = {
    Error = {
      bg = "#FF0000",
      fg = "#FF0000",
    },
  },
})
vim.cmd("color onedark_dark")
