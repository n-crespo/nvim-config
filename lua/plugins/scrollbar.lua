return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  config = function()
    require("scrollbar").setup({
      hide_if_all_visible = true, -- Hides everything if all lines are visible
      throttle_ms = 100,
      marks = {
        Error = {
          text = { "◆" },
          priority = 2,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
          text = { "◆" },
          priority = 3,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
          text = { "◆" },
          priority = 4,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
          text = { "◆" },
          priority = 5,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
          text = { "◆" },
          priority = 6,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "Normal",
        },
        GitAdd = {
          text = "+",
          priority = 7,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "GitSignsAdd",
        },
        GitChange = {
          text = "~",
          priority = 7,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "GitSignsChange",
        },
        GitDelete = {
          text = "-",
          priority = 7,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "GitSignsDelete",
        },
        Cursor = {
          priority = 1,
          highlight = "ScrollbarCursor",
        },
      },
      handle = {
        text = " ",
        blend = 0, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        highlight = "ScrollbarHandle",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
      },
      excluded_buftypes = {
        "terminal",
      },
      excluded_filetypes = {
        "snacks_terminal",
        "snacks_notif",
        "minifiles",
        "treesitter_context",
        "TelescopePrompt",
        "TelescopeResults",
        "cmp_menu",
        "cmp_docs",
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
      },
    })
    require("gitsigns").setup()

    local function prevent_overscroll(cmd)
      local cur_pos = vim.fn.line(".")
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, true, true), "n", false)

      local line_count = vim.fn.line("$")
      local half_page = vim.o.lines / 2

      if cur_pos <= line_count - half_page then
        vim.cmd("normal! zz")
      end
    end

    vim.keymap.set("n", "<C-d>", function()
      prevent_overscroll("<C-d>")
    end, { noremap = true })
    vim.keymap.set("n", "<C-u>", function()
      prevent_overscroll("<C-u>")
    end, { noremap = true })
  end,
}
