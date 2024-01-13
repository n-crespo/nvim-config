return {
  -- below is needed when using transparent background
  -- default LazyVim plugin for notifications
  "rcarriga/nvim-notify",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("notify").setup({
      background_colour = "#22272f",
    })
  end,
}
