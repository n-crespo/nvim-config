return {
  "echasnovski/mini.sessions",
  event = "VimEnter",
  version = "*",
  opts = {
    autoread = false,
    autowrite = true,
    --
    -- -- Directory where global sessions are stored (use `''` to disable)
    -- -- directory = --<"session" subdir of user data directory from |stdpath()|>,
    --
    -- -- File for local session (use `''` to disable)
    -- file = "Session.vim",
    --
    -- -- Whether to force possibly harmful actions (meaning depends on function)
    -- force = { read = false, write = true, delete = false },
    --
    -- -- Hook functions for actions. Default `nil` means 'do nothing'.
    -- hooks = {
    --   -- Before successful action
    --   pre = { read = nil, write = nil, delete = nil },
    --   -- After successful action
    --   post = { read = nil, write = nil, delete = nil },
    -- },
    --
    -- -- Whether to print session path after action
    -- verbose = { read = false, write = true, delete = true },
  },
  init = function()
    -- make :Q quit and save session
    vim.api.nvim_create_user_command("Q", "mksession | qa", { nargs = 0 })
  end,
}
