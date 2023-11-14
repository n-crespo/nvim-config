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
require("headlines").setup({
  rmarkdown = require("headlines").config.rmd,
})

-- fold                     = "#121212"
-- gray                     = "#434852"
-- inlay_hint               = "#33373e"
-- orange                   = "#d19a66"
-- white                    = "#abb2bf"
-- bg                       = "#101010"
-- red                      = "#ef596f"
-- highlight                = "#e2be7d"
-- green                    = "#89ca78"
-- virtual_text_hint        = "#4fcfd8"
-- virtual_text_information = "#90c7f4"
-- purple                   = "#d55fde"
-- fg_gutter                = "#181818"
-- bg_statusline            = "#0e0e0e"
-- fg                       = "#abb2bf"
-- indentline               = "#1f1f1f"
-- diff_add                 = "#003e4a"
-- git_change               = "#948B60"
-- git_hunk_delete_inline   = "#6f2e2d"
-- comment                  = "#7f848e"
-- git_hunk_change_inline   = "#41483d"
-- diff_delete              = "#501b20"
-- git_hunk_add_inline      = "#3f534f"
-- selection                = "#212121"
-- yellow                   = "#e5c07b"
-- virtual_text_warning     = "#edd2a1"
-- git_hunk_add             = "#43554d"
-- blue                     = "#61afef"
-- git_delete               = "#9a353d"
-- cyan                     = "#2bbac5"
-- cursorline               = "#171717"
-- fg_gutter_inactive       = "#abb2bf"
-- git_add                  = "#109868"
-- virtual_text_error       = "#f38495"
-- float_bg                 = "#000000"
-- black                    = "#000000"
-- color_column             = "#161616"
-- git_hunk_delete          = "#502d30"
-- line_number              = "#495162"
-- diff_text                = "#005869"
