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

-- autocmd to change cursor style when changing modes

local autocmd = vim.api.nvim_create_autocmd
autocmd({ "ModeChanged" }, {
  callback = function()
    local current_mode = vim.fn.mode()
    if current_mode == "n" then
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#61afef" })
      vim.fn.sign_define("smoothcursor", { text = "" })
    elseif current_mode == "v" then
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#e5c07b" })
      vim.fn.sign_define("smoothcursor", { text = "󰙒" })
    elseif current_mode == "V" then
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#e5c07b" })
      vim.fn.sign_define("smoothcursor", { text = "󰒉" })
    elseif current_mode == "i" then
      vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#89ca78" })
      vim.fn.sign_define("smoothcursor", { text = "󰗧" })
    end
  end,
})
