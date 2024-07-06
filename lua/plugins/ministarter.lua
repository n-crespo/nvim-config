-- starter page, simple and fast
return {
  "echasnovski/mini.starter",
  event = "VimEnter",
  version = false,
  opts = function()
    local starter = require("mini.starter")
    local config = {
      content_hooks = {
        starter.gen_hook.adding_bullet("░ "),
        starter.gen_hook.aligning("center", "center"),
      },
      evaluate_single = true,
      silent = true,
      autoopen = true,
      footer = "",
      -- header = "",
      query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
      items = {
        {
          name = "explore",
          action = "lua require('mini.files').open(vim.loop.cwd(), true)",
          section = " ",
        },
        {
          name = "old files",
          action = "Telescope oldfiles",
          section = " ",
        },
        {
          name = "config files",
          action = LazyVim.pick.config_files(),
          section = " ",
        },
        {
          name = "session restore",
          action = 'lua require("persistence").load()',
          section = " ",
        },
        { name = "lazy", action = "Lazy", section = " " },
        { name = "quit", action = "qa", section = " " },
      },
    }
    return config
  end,
  config = function(_, config)
    -- close Lazy and re-open when starter is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local starter = require("mini.starter")
    starter.setup(config)
  end,
}
