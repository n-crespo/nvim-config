return {
  "b0o/incline.nvim",
  event = "LazyFile",
  config = function()
    vim.g.showtabline = 0
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
        only_win = false,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local filetype = vim.bo[props.buf].filetype

        local ft_icon, ft_color, _ = MiniIcons.get("filetype", filetype)
        -- print("ft_icon:", ft_icon, "ft_color:", ft_color, "filename:", filename)

        local modified = vim.bo[props.buf].modified

        local hl = vim.api.nvim_get_hl(0, { name = ft_color })

        -- Convert RGB to HEX for foreground and background
        local fg_hex = hl.fg and string.format("#%06x", hl.fg) or "none"
        local bg_hex = hl.bg and string.format("#%06x", hl.bg) or "none"

        -- print("Foreground:", fg_hex)
        -- print("Background:", bg_hex)

        return {
          { (ft_icon or "") .. " ", guifg = fg_hex, guibg = "none" },
          { filename, gui = modified and "bold" or "none" },
          { modified and " " or "" },
        }
      end,
    })
  end,
}
