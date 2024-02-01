-- auto toggle table mode when opening and closing markdown file
vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  callback = function()
    vim.cmd([[setlocal nowrap]])
    vim.keymap.set(
      "n",
      "<C-s>",
      "<cmd>TableModeRealign<cr><cmd>w<cr>",
      { desc = "Save and Format File", buffer = true, silent = true }
    )
  end,
})

vim.api.nvim_create_autocmd(
  { "FileType", "BufRead", "BufEnter", "BufNewFile", "BufAdd", "BufFilePost", "BufFilePre" },
  {
    pattern = { "rmarkdown" },
    callback = function()
      vim.cmd([[set ft=rmd]])
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

-- make :W the same as :w
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })

-- make :Q the same as :q
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })
