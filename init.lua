require("config.lazy")

-- for some reason my r markdown files have a rmd filetpe, this just allows the
-- headlines plugin to work for them too (Disabled bc it makes things lag)

-- require("headlines").setup({
--   rmarkdown = require("headlines").config.rmd,
-- })

---@diagnostic disable-next-line: missing-fields
require("notify").setup({
  background_colour = "#000000",
})
