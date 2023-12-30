return {
  "lukas-reineke/headlines.nvim",
  opts = function()
    local opts = {}
    for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
      opts[ft] = {
        headline_highlights = {},
        -- i think these are too fat (check wikipedia unicode)
        -- fat_headline_upper_string = "▄",
        -- line for visual separation
        -- fat_headline_lower_string = "▀",
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
    vim.schedule(function()
      require("headlines").setup(opts)
      require("headlines").refresh()
    end)

    -- for some reason my r markdown files have a rmd filetpe, this just allows the
    -- headlines plugin to work for them too (Disabled bc it makes things lag)
    require("headlines").setup({
      rmarkdown = require("headlines").config.rmd,
    })
  end,
}
