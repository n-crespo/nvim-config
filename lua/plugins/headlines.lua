return {
  "lukas-reineke/headlines.nvim",
  opts = function()
    local opts = {}
    for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
      opts[ft] = {
        headline_highlights = {},
        -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
        bullets = {},
        fat_headlines = false,
        codeblock_highlght = false,
      }
    end
    return opts
  end,
  ft = { "markdown", "norg", "rmd", "org" },
  config = function(_, opts)
    -- PERF: schedule to prevent headlines slowing down opening a file
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
