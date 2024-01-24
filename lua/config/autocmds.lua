-- when exiting telescope, always be in normal mode
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
  callback = function(event)
    if vim.bo[event.buf].filetype == "telescopeprompt" then
      vim.api.nvim_exec2("silent! stopinsert!", {})
    end
  end,
})

-- auto toggle table mode when opening and closing markdown file
vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile" }, {
  pattern = { "markdown" },
  callback = function()
    vim.cmd([[silent! TableModeToggle]])
    vim.cmd([[set nowrap]])
  end,
})

vim.api.nvim_create_autocmd(
  { "FileType", "BufRead", "BufEnter", "BufNewFile", "BufAdd", "BufFilePost", "BufFilePre" },
  {
    pattern = { "rmarkdown" },
    callback = function()
      vim.cmd([[set ft=rmd]])
      -- print("filetype set to rmd")
    end,
  }
)

-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  pattern = { "*" },
  command = [[call setreg("@", getreg("+"))]],
})

-- sync with system clipboard on focus
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  pattern = { "*" },
  command = [[call setreg("+", getreg("@"))]],
})

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "ModeChanged" }, {
  callback = function()
    local current_mode = vim.fn.mode()
    if current_mode == "n" then
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#8aa872" })
      vim.fn.sign_define("smoothcursor", { text = "" })
    elseif current_mode == "v" then
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
      vim.fn.sign_define("smoothcursor", { text = "󰙒" })
    elseif current_mode == "V" then
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
      vim.fn.sign_define("smoothcursor", { text = "󰒉" })
    -- elseif current_mode == "�" then
    --   vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
    --   vim.fn.sign_define("smoothcursor", { text = "" })
    elseif current_mode == "i" then
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#668aab" })
      vim.fn.sign_define("smoothcursor", { text = "" })
    end
  end,
})
