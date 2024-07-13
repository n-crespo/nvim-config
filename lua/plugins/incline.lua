return {
  "b0o/incline.nvim",
  event = "LazyFile",
  config = function()
    vim.g.showtabline = 0
    local devicons = require("nvim-web-devicons")
    require("incline").setup({
      window = {
        options = {
          buftype = "nofile",
        },
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
          { (filename .. (modified and " " or "")), gui = modified and "bold" or "none" },
        }
      end,
    })
  end,
}
