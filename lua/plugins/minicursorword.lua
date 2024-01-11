return {
  {
    "echasnovski/mini.cursorword",
    version = false,
    config = function()
      require("mini.cursorword").setup({
        -- Delay (in ms) between when cursor moved and when highlighting appeared
        delay = 100,
      })
    end,
  },
}
