-- TODO: Fix this config. When to disable? Fix Lualine component.
return {
  "monkoose/neocodeium",
  event = "InsertEnter",
  opts = {
    max_lines = 500, -- restrict num of lines read from non-focused buffers
    enabled = false, -- don't enable on start
    manual = false, -- require <C-n>? nah
    show_label = false, -- thing next to line numbers
    silent = false, -- notification when server is started
    filetypes = {
      help = false,
      gitcommit = false,
      gitrebase = false,
      TelescopePrompt = false,
      minifiles = false,
    },
  },
  config = function(_, opts)
    require("neocodeium").setup(opts)

    function ToggleCodeiumInsert()
      local plugin, server = require("neocodeium").get_status()
      if vim.g.neocodeium_enabled then
        vim.cmd([[NeoCodeium enable]])
        require("neocodeium").cycle_or_complete()
      else
        require("neocodeium").clear()
      end
    end

    -- only start the codeium server if toggle is on AND in insert mode.
    -- disable server once insert mode is left
    -- vim.api.nvim_create_autocmd("InsertEnter", {
    --   callback = function()
    --     if vim.g.neocodeium_enabled then
    --       vim.cmd([[NeoCodeium enable]])
    --     end
    --   end,
    -- })
    -- vim.api.nvim_create_autocmd("InsertLeave", {
    --   callback = function()
    --     vim.cmd([[NeoCodeium disable]])
    --   end,
    -- })
  end,
  keys = {
    -- in normal mode
    {
      "<C-S-A>",
      function()
        ToggleCodeium()
      end,
      mode = "n",
      desc = "Toggle Codeium",
    },
    -- in insert mode
    {
      "<C-S-A>",
      function()
        ToggleCodeiumInsert()
      end,
      mode = "i",
      desc = "Toggle Codeium",
    },
    {
      "<C-a>",
      function()
        ToggleCodeiumInsert()
      end,
      mode = "i",
    },
    {
      "<C-CR>",
      function()
        require("neocodeium").accept()
      end,
      mode = { "i" },
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
        require("neocodeium").cycle_or_complete(1)
      end,
      mode = "i",
    },
  },
}
