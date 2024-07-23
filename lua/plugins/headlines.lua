return {
  "lukas-reineke/headlines.nvim",
  opts = function()
    local opts = {}
    for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
      opts[ft] = {
        headline_highlights = {},
        -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
        bullets = {},
        dash_string = "-",
        fat_headlines = false,
        codeblock_highlght = false,
      }
      for i = 1, 6 do
        local hl = "Headline" .. i
        vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
        table.insert(opts[ft].headline_highlights, hl)
      end
    end
    return opts
  end,
  ft = { "markdown", "norg", "rmd", "org" },
  config = function(_, opts)
    -- PERF: schedule to prevent headlines slowing down opening a file
    vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])
    vim.schedule(function()
      require("headlines").setup(opts)
      require("headlines").refresh()
    end)

    -- codeblock background toggle keymap
    vim.g.toggle_codeblock_bg = true
    function ToggleCodeblockBackground()
      if vim.g.toggle_codeblock_bg then
        vim.cmd("hi Codeblock guibg=nil")
      else
        vim.cmd("hi Codeblock guibg=#201d1d")
      end
      vim.g.toggle_codeblock_bg = not vim.g.toggle_codeblock_bg
    end
  end,
  keys = {
    {
      "<leader>tb",
      function()
        ToggleCodeblockBackground()
      end,
      desc = "Toggle codeblock background",
      ft = { "markdown", "rmd", "rmarkdown", "norg", "org" },
      silent = true,
    },
  },
}
