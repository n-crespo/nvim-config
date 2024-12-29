local M = {}

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function open_floating_terminal(opts)
  opts = opts or {}

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2) - 2

  if opts.position == "right" then
    height = math.floor(vim.o.lines * 0.9)
    width = math.floor(vim.o.columns / 2) - 1
    col = vim.o.columns - width - 2
    row = math.floor((vim.o.lines - height) / 2) - 1
  end

  -- Create the floating window
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- Create a new, unlisted buffer
    vim.bo[buf].bufhidden = "hide" -- Set bufhidden to "hide"
  end

  -- Set up the window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "single",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  -- Optional: Double escape to normal mode
  local esc_timer
  vim.keymap.set("t", "<esc>", function()
    if not esc_timer then
      esc_timer = (vim.uv or vim.loop).new_timer()
    end
    if esc_timer and esc_timer:is_active() then
      esc_timer:stop()
      vim.cmd("stopinsert")
    else
      ---@diagnostic disable-next-line: need-check-nil
      esc_timer:start(200, 0, function() end)
    end
  end, {
    buffer = state.floating.buf,
    desc = "Double escape to normal mode",
  })

  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(state.floating.win) then
      vim.api.nvim_win_hide(state.floating.win)
    end
  end, {
    buffer = vim.api.nvim_buf_is_valid(state.floating.buf) and state.floating.buf or true,
    noremap = true,
    silent = true,
    desc = "Hide Terminal",
  })

  vim.cmd("startinsert")

  return { buf = buf, win = win }
end

local toggle_terminal = function(opts)
  opts = opts or {}
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    vim.notify("creating a new terminal...")
    state.floating = open_floating_terminal({ buf = state.floating.buf, position = opts.position or "center" })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.notify("hiding the terminal...")
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set({ "n", "t" }, "<C-S-/>", toggle_terminal, { noremap = true, silent = true })
vim.keymap.set({ "n", "t" }, "<C-S-Q>", toggle_terminal, { noremap = true, silent = true })

vim.keymap.set({ "n", "t" }, "<C-.>", function()
  toggle_terminal({ position = "right" })
end, { noremap = true, silent = true })

return M
