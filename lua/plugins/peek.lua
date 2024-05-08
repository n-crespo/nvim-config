return {
  "toppair/peek.nvim",
  ft = "markdown",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    local path = os.getenv("HOME")
    ---@diagnostic disable-next-line: param-type-mismatch
    if string.sub(path, 1, 6) == "/Users" then
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = false,
        syntax = true,
        theme = "dark",
        update_on_change = true,
      })
    else
      require("peek").setup({
        auto_load = true,
        close_on_bdelete = false,
        syntax = true,
        theme = "dark",
        update_on_change = true,
        app = { "/mnt/c/Program Files/Mercury/mercury.exe", "--new-window" }, -- 'webview', 'browser', string or a table of strings explained below
      })
    end
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
  keys = {
    { "<leader>op", "<cmd>PeekOpen<cr>", desc = "Open Peek Preview", buffer = true },
  },
}
