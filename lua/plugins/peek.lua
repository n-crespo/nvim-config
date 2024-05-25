return {
  "toppair/peek.nvim",
  ft = "markdown",
  build = "deno task --quiet build:fast",
  config = function()
    if vim.fn.has("wsl") then
      vim.notify("hello")
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = false,
        syntax = true,
        theme = "dark",
        update_on_change = true,
        app = { "/mnt/c/Program Files/Mercury/mercury.exe", "--new-window", "--kiosk" }, -- 'webview', 'browser', string or a table of strings explained below
      })
    else
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = false,
        syntax = true,
        theme = "dark",
        update_on_change = true,
      })
    end
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
  keys = {
    { "<leader>op", "<cmd>PeekOpen<cr>", desc = "Open Peek Preview", buffer = true },
  },
}
