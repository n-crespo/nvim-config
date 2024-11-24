return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  config = function()
    require("scrollbar").setup({
      hide_if_all_visible = true, -- Hides everything if all lines are visible
      throttle_ms = 100,
      handle = {
        text = " ",
        blend = 0, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        highlight = "ScrollbarHandle",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
      },
      excluded_buftypes = {
        "terminal",
      },
      excluded_filetypes = {
        "snacks_terminal",
        "snacks_notif",
        "minifiles",
      },
      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
      },
    })
    require("gitsigns").setup()
    require("scrollbar.handlers.gitsigns").setup()

    local function prevent_overscroll(cmd)
      local cur_pos = vim.fn.line(".")
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, true, true), "n", false)

      local line_count = vim.fn.line("$")
      local half_page = vim.o.lines / 2

      if cur_pos <= line_count - half_page then
        vim.cmd("normal! zz")
      end
    end

    vim.keymap.set("n", "<C-d>", function()
      prevent_overscroll("<C-d>")
    end, { noremap = true })
    vim.keymap.set("n", "<C-u>", function()
      prevent_overscroll("<C-u>")
    end, { noremap = true })
  end,
}
