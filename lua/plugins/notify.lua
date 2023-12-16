return {
  "rcarriga/nvim-notify",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}
