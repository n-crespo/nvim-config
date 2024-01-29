-- cursor animation beside line numbers, doesn't actually slow down cursor movement
-- (animation helps during disorienting motions )
return {
  "gen740/SmoothCursor.nvim",
  event = "LazyFile",
  opts = {
    type = "exp", -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".
    cursor = "", -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
    texthl = "SmoothCursor", -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
    linehl = nil, -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

    fancy = {
      enable = true, -- enable fancy mode
      head = { cursor = "", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
      body = {
        -- red, orange, yellow, green, aqua, blue, purple
        -- { cursor = "󰝥", texthl = "SmoothCursorAqua" },
        -- { cursor = "󰝥", texthl = "SmoothCursorAqua" },
        -- { cursor = "●", texthl = "SmoothCursorAqua" },
        { cursor = "●", texthl = "SmoothCursorAqua" },
        { cursor = "•", texthl = "SmoothCursorAqua" },
        { cursor = ".", texthl = "SmoothCursorAqua" },
        -- { cursor = ".", texthl = "SmoothCursorAqua" },
      },
      tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
    },

    autostart = true, -- Automatically start SmoothCursor
    always_redraw = true, -- Redraw the screen on each update
    flyin_effect = "bottom", -- Choose "bottom" or "top" for flying effect
    speed = 50, -- Max speed is 100 to stick with your current position
    intervals = 35, -- Update intervals in milliseconds
    priority = 1000, -- Set marker priority
    timeout = 3000, -- Timeout for animations in milliseconds
    threshold = 3, -- Animate only if cursor moves more than this many lines
    disable_float_win = true, -- Disable in floating windows
    enabled_filetypes = nil, -- Enable only for specific file types, e.g., { "lua", "vim" }
    disabled_filetypes = { "minifiles", "better_term", "TelescopePrompt", "startuptime", "lazy" }, -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
    -- Show the position of the latest input mode positions.
    -- A value of "enter" means the position will be updated when entering the mode.
    -- A value of "leave" means the position will be updated when leaving the mode.
    -- `nil` = disabled
    show_last_positions = nil,
  },
}
