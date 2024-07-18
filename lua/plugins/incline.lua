return {
  "b0o/incline.nvim",
  event = "LazyFile",
  config = function()
    vim.g.showtabline = 0
    local devicons = require("nvim-web-devicons")
    require("incline").setup({
      window = {
        -- placement = { vertical = "top", horizontal = "center" },
        options = { buftype = "nofile", wrap = false },
        margin = { horizontal = 0, vertical = 1 },
        overlap = { tabline = false, winbar = false },
        width = "fit",
      },
      hide = {
        cursorline = "focused_win",
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end

        local ft_icon, ft_color = devicons.get_icon_color(filename)

        local modified = vim.bo[props.buf].modified

        return {
          -- { get_diagnostic_label() },
          { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
          { filename, gui = modified and "bold" or "none" },
          { modified and " " or "" },
        }
      end,
    })
  end,
}
