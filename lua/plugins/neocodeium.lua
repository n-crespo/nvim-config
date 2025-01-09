return {
  "monkoose/neocodeium",
  event = "InsertEnter",
  enabled = not LazyVim.is_win(),
  opts = {
    max_lines = 200, -- restrict num of lines read from non-focused buffers
    enabled = false, -- don't enable on start
    manual = false, -- require <C-n>? nah
    show_label = false, -- thing next to line numbers
    silent = true, -- notification when server is started
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

    -- refresh lualine whenever codeium server does something or plugin itself
    -- is disabled
    vim.api.nvim_create_autocmd("User", {
      pattern = { "NeoCodeiumServer*", "NeoCodeium*{En,Dis}abled" },
      callback = function()
        require("lualine").refresh()
      end,
    })

    -- when in insert mode, toggle completion only
    function ToggleCodeiumInsert()
      local plugin, _ = require("neocodeium").get_status()
      if plugin > 0 then -- (completion is disabled)
        vim.cmd([[NeoCodeium enable]])
        vim.notify("Codeium completion enabled", vim.log.levels.INFO, { title = "Codeium" })
      else -- (completion is enabled)
        vim.cmd([[NeoCodeium disable]]) -- disable completion
        require("neocodeium").clear()
        vim.notify("Codeium completion disabled", vim.log.levels.WARN, { title = "Codeium" })
      end
    end

    -- when in normal mode, keymap toggle servers
    function ToggleCodeium()
      local _, server = require("neocodeium").get_status()
      if server == 2 then
        vim.cmd([[NeoCodeium enable]])
        vim.notify("NeoCodeium: the server has been started", vim.log.levels.INFO, { title = "Codeium" })
      elseif server == 0 then
        vim.cmd([[NeoCodeium! disable]])
        -- vim.notify("Codeium server stopped...", vim.log.levels.WARN, { title = "Codeium" })
      end
    end

    -- allow user to use :lua ToggleCodeium()
    _G.ToggleCodeiumInsert = ToggleCodeiumInsert
    _G.ToggleCodeium = ToggleCodeium

    -- start codeium when entering insert mode (FOR THE FIRST TIME)
    vim.api.nvim_create_autocmd("InsertEnter", {
      once = true,
      callback = function()
        vim.cmd([[NeoCodeium enable]])
      end,
    })
  end,
  keys = {
    -- toggles server (normal mode)
    {
      "<C-S-A>",
      function()
        ToggleCodeium()
      end,
      mode = "n",
      desc = "Toggle Codeium",
    },
    -- toggles completion (insert mode)
    {
      "<C-S-A>",
      function()
        ToggleCodeiumInsert()
      end,
      mode = "i",
      desc = "Toggle Codeium",
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
