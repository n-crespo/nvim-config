return {
  "monkoose/neocodeium",
  enabled = vim.fn.has("win32") == 0, -- don't enable in windows
  event = "InsertEnter",
  opts = {
    show_label = false,
    silent = true,
    filetypes = {
      help = false,
      gitcommit = false,
      gitrebase = false,
      TelescopePrompt = false,
      minifiles = false,
    },
  },
  config = function(_, opts)
    vim.g.neocodeium_enabled = true
    require("neocodeium").setup(opts)
    function ToggleCodeium()
      vim.g.neocodeium_enabled = not vim.g.neocodeium_enabled
      if not vim.g.neocodeium_enabled then
        vim.notify("Disabled Codeium", vim.log.levels.WARN, { title = "Codeium" })
        require("neocodeium").clear()
        vim.cmd("NeoCodeium disable")
      else
        vim.notify("Enabled Codeium", vim.log.levels.INFO, { title = "Codeium" })
        require("neocodeium").cycle_or_complete()
        vim.cmd("NeoCodeium enable")
      end
    end
  end,
  keys = {
    {
      "<C-CR>",
      function()
        require("neocodeium").accept()
      end,
      mode = { "i" },
    },
    {
      "<C-a>",
      function()
        ToggleCodeium()
      end,

      mode = "i",
    },
    {
      "<C-S-A>",
      function()
        ToggleCodeium()
      end,
      mode = { "n", "i" },
    },
    {
      "<C-n>",
      function()
        require("neocodeium").cycle_or_complete()
      end,
      mode = "i",
    },
    {
      "<C-p>",
      function()
        require("neocodeium").cycle_or_complete(-1)
      end,
      mode = "i",
    },
  },
}
