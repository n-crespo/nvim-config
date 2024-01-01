return {
  -- AMAZING plugin that stops nested nvim instances from being created
  -- in :term or betterterm, (C-q), using `nvim {file}` will open the file in
  -- the primary instance of neovim. amazing.
  "willothy/flatten.nvim",
  -- config = true,
  -- or pass configuration with
  opts = { window = { open = "alternate" } },
  -- Ensure that it runs first to minimize delay when opening file from terminal
  lazy = false,
  priority = 1001,
}
