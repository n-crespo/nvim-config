return {
  "akinsho/toggleterm.nvim",
  enabled = false,
  event = "VeryLazy",
  version = "*",
  opts = {--[[ things you want to change go here]]
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 18
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.5
      end
    end,
    highlights = {
      FloatBorder = { link = "FloatBorder" },
    },
    open_mapping = [[<c-q>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    shading_factor = "0", -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
    start_in_insert = true,
    insert_mappings = false, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    direction = "horizontal", --| "vertical" | "tab" | "float",
    float_opts = {
      border = "single",
      width = 160,
      height = 40,
      -- height = vim.o.lines * 0.5,
      -- winblend = 0,
    },
  },
  keys = {
    { "<C-.>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal", mode = { "n", "t" } },
    { "<C-Q>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal", mode = { "n", "t" } },
    { "<C-S-Q>", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal", mode = { "n", "t" } },
    { "<C-S-/>", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal", mode = { "n", "t" } },
  },
}
