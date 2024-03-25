return {
  "junegunn/goyo.vim",
  cmd = "Goyo",
  config = function()
    vim.api.nvim_create_autocmd({ "GoyoEnter" }, {
      pattern = { "noice" },
      callback = function()
        ---@diagnostic disable-next-line: missing-parameter
        require("lualine").hide()
      end,
    })

    vim.api.nvim_create_autocmd({ "GoyoLeave" }, {
      pattern = { "noice" },
      callback = function()
        ---@diagnostic disable-next-line: missing-parameter, missing-fields
        require("lualine").hide({ unhide = true })
      end,
    })
  end,
}
