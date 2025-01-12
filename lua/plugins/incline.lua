return {
  "b0o/incline.nvim",
  event = "LazyFile",
  dependencies = {
    "folke/snacks.nvim",
    opts = {
      zen = {
        on_close = function()
          require("incline").enable()
        end,
        on_open = function()
          require("incline").disable()
        end,
      },
    },
  },
  opts = {
    window = {
      -- placement = { vertical = "top", horizontal = "center" },
      options = { buftype = "nofile", wrap = false },
      margin = { horizontal = 0, vertical = 1 },
      overlap = { tabline = false, winbar = false },
      width = "fit",
    },
    hide = {
      cursorline = "focused_win",
      only_win = false,
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      if filename == "" then
        filename = "[No Name]"
      end

      local ft_icon, ft_color = require("mini.icons").get("file", filename)
      local modified = vim.bo[props.buf].modified
      return {
        ft_icon and { (ft_icon or "") .. " ", group = ft_color, guibg = "none" } or "",
        { filename, gui = modified and "bold" or "none" },
        { modified and " " or "" },
      }
    end,
  },
}
