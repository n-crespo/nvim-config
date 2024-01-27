return {
  -- AMAZING plugin that stops nested nvim instances from being created
  -- in :term or betterterm, (C-q), using `nvim {file}` will open the file in
  -- the primary instance of neovim. amazing.
  "willothy/flatten.nvim",
  opts = { window = { open = "alternate" } },
  lazy = false, -- Ensure that it runs first to minimize delay when opening file from terminal
  priority = 1001,
}
