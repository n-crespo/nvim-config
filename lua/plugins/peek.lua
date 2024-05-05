return {
  "toppair/peek.nvim",
  ft = "markdown",
  -- event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup({
      auto_load = true, -- whether to automatically load preview when entering another markdown buffer
      close_on_bdelete = true, -- close preview window on buffer delete
      syntax = true, -- enable syntax highlighting, affects performance
      theme = "dark",
      update_on_change = true,
      app = { "/mnt/c/Program Files/Mercury/mercury.exe", "--new-window" }, -- 'webview', 'browser', string or a table of strings explained below
    })
    -- vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    -- vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    vim.keymap.set("n", "<leader>op", require("peek").open, { desc = "Open Peek Preview", buffer = true })
  end,
}
