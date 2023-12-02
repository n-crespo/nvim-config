-- when exiting telescope, always be in normal mode
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  callback = function(event)
    if vim.bo[event.buf].filetype == "telescopeprompt" then
      vim.api.nvim_exec2("silent! stopinsert!", {})
    end
  end,
})

-- set conceallevel to 3 on Rmd files, overriding some plugin (see
-- lua/plugins/rmarkdown.lua)
vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
  pattern = { "*.Rmd" },
  callback = function()
    vim.opt_local.conceallevel = 3
  end,
})

local Util = require("lazyvim.util")
-- disable diagnostics on markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.md" },
  callback = function()
    Util.toggle.diagnostics()
  end,
})
