return {
  -- plugin for managing temporary scratch files for various languages
  "m-demare/attempt.nvim",
  opts = function()
    require("attempt").setup({
      -- dir = (unix and "/tmp/" or vim.fn.expand("$TEMP\\")) .. "attempt.nvim" .. path_separator,
      autosave = true,
      list_buffers = false, -- This will make them show on other pickers (like :Telescope buffers)
      ext_options = { "java", "cpp", "js", "py", "c" }, -- Options to choose from
      -- format_opts = { [""] = "[None]" }, -- How they'll look
    })
  end,
  keys = function()
    local attempt = require("attempt")

    function map(mode, l, r, opts)
      opts = opts or {}
      opts = vim.tbl_extend("force", { silent = true }, opts)
      vim.keymap.set(mode, l, r, opts)
    end

    -- map("n", "<leader>an", attempt.new_select) -- new attempt, selecting extension
    map("n", "<leader>an", attempt.new_input_ext, { desc = "[n]ew" }) -- new attempt, inputing extension
    -- map("n", "<leader>ar", attempt.run) -- run attempt
    map("n", "<leader>ad", attempt.delete_buf, { desc = "[d]elete" }) -- delete attempt from current buffer
    map("n", "<leader>ar", attempt.rename_buf, { desc = "[r]ename" }) -- rename attempt from current buffer
    -- map("n", "<leader>al", "Telescope attempt") -- search through attempts
    map("n", "<leader>ap", attempt.open_select, { desc = "[p]ick" }) -- use ui.select instead of telescope
  end,
}
