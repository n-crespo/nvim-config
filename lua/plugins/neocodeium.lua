return {
  "monkoose/neocodeium",
  enabled = true,
  event = "InsertEnter",
  config = function()
    require("neocodeium").setup()
  end,
  keys = {
    {
      "<C-CR>",
      function()
        vim.cmd([[echo "accepted"]])
        require("neocodeium").accept()
      end,
      mode = { "i" },
    },
    {
      "<C-n>",
      function()
        vim.cmd([[echo "next"]])
        require("neocodeium").cycle_or_complete()
      end,
      mode = "i",
    },
    {
      "<C-p>",
      function()
        vim.cmd([[echo "prev"]])
        require("neocodeium").cycle_or_complete(1)
      end,
      mode = "i",
    },
  },
}
