-- i no longer use prettier for markdown, cbfmt instead
-- vim.cmd([[inoreabbrev <buffer> ps <!-- prettier-ignore-start -->]])
-- vim.cmd([[inoreabbrev <buffer> pe <!-- prettier-ignore-end -->]])

-- NOTE; these save to the `r` register arbitrarily as to not clog up system
-- clipboard bold/italicize in visual mode
vim.keymap.set("i", "<C-b>", "****<left><left>", { buffer = true, silent = true })
vim.keymap.set("x", "<C-b>", '"rc****<esc>h"rP', { buffer = true, desc = "Bold" })
vim.keymap.set("x", "<C-i>", '"rc__<esc>"rP', { buffer = true, desc = "Italicize" })
vim.opt.foldmethod = "expr" -- folds headers and lists nicely

-- this is a fairly rudimentary table formatting support on save
local pattern = "^%s*|.*|%s*$"

local function isInTable(line)
  if line == nil then
    return false
  else
    return string.find(line, pattern) ~= nil
  end
end

-- from zero exclusive
local function findBorders(num)
  local top, bottom = num + 1, num + 1
  while isInTable(vim.api.nvim_buf_get_lines(0, top - 1, top, false)[1]) do
    top = top - 1
  end
  while isInTable(vim.api.nvim_buf_get_lines(0, bottom, bottom + 1, false)[1]) do
    bottom = bottom + 1
  end
  return top, bottom
end

local function getSeparatorPos(line)
  local seps = {}
  local idx = string.find(line, "|", 1)
  while idx ~= nil do
    table.insert(seps, idx)
    idx = string.find(line, "|", idx + 1)
  end
  return seps
end

local function formatTable(top, bottom)
  local line = vim.api.nvim_buf_get_lines(0, top + 1, top + 2, false)[1]
  local _, columns = string.gsub(line, "|", "")
  columns = columns - 1
  local max_columns = {}
  for i = 1, columns do
    table.insert(max_columns, i, 0)
  end
  for i = top, bottom - 1 do
    line = vim.api.nvim_buf_get_lines(0, i, i + 1, true)[1]
    local seps = getSeparatorPos(line)
    for j = 1, columns do
      -- Calculate the cell content width *without* the padding
      local cell_content = string.sub(line, seps[j] + 1, seps[j + 1] - 1)
      local cell_width = string.len(string.gsub(cell_content, "%s+", ""))
      max_columns[j] = math.max(max_columns[j], cell_width)
    end
  end

  for i = top, bottom - 1 do
    line = vim.api.nvim_buf_get_lines(0, i, i + 1, true)[1]
    local seps = getSeparatorPos(line)
    local new_line = "|"
    for j = 1, columns do
      -- Extract the cell content, trim leading/trailing spaces
      local cell_content = string.sub(line, seps[j] + 1, seps[j + 1] - 1)
      cell_content = string.gsub(cell_content, "^%s*(.-)%s*$", "%1") -- Trim spaces

      -- Calculate padding needed
      local padding_needed = max_columns[j] - string.len(cell_content)

      -- Build the new cell with padding
      new_line = new_line
        .. " " -- Left padding
        .. cell_content
        .. string.rep(" ", padding_needed) -- Right padding to reach max width
        .. " |" -- Right border and space
    end
    vim.api.nvim_buf_set_lines(0, i, i + 1, true, { new_line })
  end
end

local function tableFormat()
  local line = vim.api.nvim_get_current_line()
  if not isInTable(line) then
    return
  end
  local line_num = vim.api.nvim_win_get_cursor(0)[1] - 1
  local top, bottom = findBorders(line_num)
  formatTable(top, bottom)
end

vim.api.nvim_create_autocmd("BufWrite", {
  callback = function()
    pcall(tableFormat)
  end,
})

vim.api.nvim_buf_create_user_command(0, "TableFormat", function()
  tableFormat()
end, {})
