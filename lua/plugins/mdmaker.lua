return {
  "NStefan002/mdmaker.nvim",
  cmd = "MdMake",
  opts = {
    nvim_dir = "~/.config/nvim/",
    output = "~/.config/nvim/lua/plugins/README.md",
    enable_url_check = false, -- disable if generating README.md offline or with a bad connection
    package_maganer = "folke/lazy.nvim",
    -- If you don't want any of the following fields, set them to ""
    title = "Neovim Configuration",
    version_manager = { name = "", url = "" },
    gui = { name = "", url = "" },
  },
}
