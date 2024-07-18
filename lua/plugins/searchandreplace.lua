return {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  keys = {
    {
      "<leader>sr",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      -- desc = " rip substitute",
      desc = "Search and Replace",
    },
  },
}
