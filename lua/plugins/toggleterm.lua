return {
  "akinsho/toggleterm.nvim",
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
    shading_factor = "0", -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
    start_in_insert = true,
    insert_mappings = false, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    direction = "horizontal", --| "vertical" | "tab" | "float",
    float_opts = { border = "curved" },
    -- This field is only relevant if direction is set to 'float'
  },
  keys = {
    { "<C-S-Q>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "ToggleTerm vertical", mode = { "n", "t" } },
    { "<C-Q>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal", mode = { "n", "t" } },
    { "<C-/>", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float", mode = { "n", "t" } },
  },
}
