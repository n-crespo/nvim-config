return {
  "backdround/global-note.nvim",
  event = "LazyFile",
  enabled = false,
  opts = {
    -- Filename to use for default note (preset).
    -- string or fun(): string
    filename = "NOTE.md",

    -- Directory to keep default note (preset).
    -- string or fun(): string
    directory = "~/Notes/notes",

    -- Floating window title.
    -- string or fun(): string
    title = "NOTE",

    -- Ex command name.
    -- string
    command_name = "GlobalNote",

    -- A nvim_open_win config to show float window.
    -- table or fun(): table
    window_config = function()
      local window_height = vim.api.nvim_list_uis()[1].height
      local window_width = vim.api.nvim_list_uis()[1].width
      return {
        relative = "editor",
        border = "single",
        title = "Note",
        title_pos = "center",
        width = math.floor(0.7 * window_width),
        height = math.floor(0.85 * window_height),
        row = math.floor(0.05 * window_height),
        col = math.floor(0.15 * window_width),
      }
    end,
    autosave = true,
  },
  config = function(_, opts)
    require("global-note").setup(opts)
    vim.keymap.set("n", "<leader>n", require("global-note").toggle_note(), { desc = "Toggle global note" })
  end,
}
