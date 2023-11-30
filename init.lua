require("config.lazy")

-- for some reason my r markdown files have a rmd filetpe, this just allows the
-- headlines plugin to work for them too
require("headlines").setup({
  rmarkdown = require("headlines").config.rmd,
})

---@diagnostic disable-next-line: missing-fields
require("notify").setup({
  background_colour = "#000000",
})

-- use better scroll-off plugin
require("scrollEOF").setup({
  -- The pattern used for the internal autocmd to determine
  -- where to run scrollEOF. See https://neovim.io/doc/user/autocmd.html#autocmd-pattern
  pattern = "*",
  -- Whether or not scrollEOF should be enabled in insert mode
  insert_mode = false,
  -- List of filetypes to disable scrollEOF for.
  disabled_filetypes = { "minifiles" },
  -- List of modes to disable scrollEOF for. see https://neovim.io/doc/user/builtin.html#mode() for available modes.
  disabled_modes = {},
})

require("onedarkpro").setup({
  styles = { -- For example, to apply bold and italic, use "bold,italic"
    comments = "italic", -- Style that is applied to comments
    virtual_text = "bold", -- Style that is applied to virtual text
  },
  options = {
    cursorline = false, -- Use cursorline highlighting?
    transparency = true, -- Use a transparent background?
    terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
    highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
  },
})

vim.cmd("color onedark_dark")
