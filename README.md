# My Neovim Config

## Description

My neovim config based on LazyVim, with added plugins, LSPs, and keymaps.
If you don't understand how this works, you probably shouldn't use this
configuration. First check out lazyvim, NvChad, or kickstart.nvim, and
understand how plugins, keymaps, LSPs, and the rest of the config works.

## Interesting Things

Some interesting things in this configuration are:

- The entire `keymaps.lua` file (plugin specific, very much personal
preference)(but some of them are *muah*)
- Some of the `options.lua` file (not plugin specific, everyone should use these
regardless of your config)
- The plugins MdMaker, UndoTree, LazyGit, and Mini Files are cool
- With this config I consistently have a ~30ms startup time. (100ms+ are rookie numbers)
- The "NEOVIM" text on the startup screen took way too long to get working, but
it looks sick (uses plugin called Alpha)
- Lualine now shows 12-hour time (*\'murica*)
- I use the carbonfox theme
- the vim-table-mode plugin is awesome
- check recent commits for other cool stuff I found

> **Note**: many of the plugins I use are not visible in lua/plugins/ because I
> use the lazyvim configuration which comes with lots of plugins. You can see
> these in these in the [LazyVim repo](https://github.com/LazyVim/LazyVim). I
> also have disabled some plugins that come with LazyVim in the `overrides.lua`
> file.

To use this configuration (I don't recommend this, make your own)(this probably
won't work for you anyway), just clone the repo into your `~/.config/nvim
`folder. If you don't know how to do that, you shouldn't be using this in the
first place. If you're using Windows, stop. Use WSL and do everything from
there.

> **Note**: If you do end up cloning this repo to use it, the jdtls (java) LSP
> may give you some errors if you don't have it installed. I don't suggest
> installing it unless absolutely necessary. Just delete all the files that
> reference jdtls.
