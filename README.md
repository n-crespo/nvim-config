# My Neovim Config

## Description
My neovim config based on LazyVim, with added plugins, LSPs, and keymaps.
If you can't understand how this works, you should probably not use this configuration. First check out lazyvim, NvChad, or kickstart.nvim, and understand how plugins, keymaps and the rest of the config works. 

## Interesting Things
Some interesting things in this configuration are:

- The entire keymaps.lua file (plugin specific, very much personal preference)(but some of them are *muah*)
- Some of the options.lua file (not plugin specific, everyone should use these regardless of your config)
- The plugins Harpoon, UndoTree, LazyGit, and Mini Files are cool
- With this config I consistently have a ~30ms startup time. (100ms is way too long)
- The homescreen "NEOVIM" text took way too long to get working, but it looks sick
- Lualine now shows 12-hour time (murica)
- I use tokyodark with a transparent background because pastel blue looks childish

> **Note**: many of the plugins I use are not visible in lua/plugins/ because I use the lazyvim configuration which comes with lots of plugins. You can see these in these in the [LazyVim repo](https://github.com/LazyVim/LazyVim). I also have disabled some plugins that come with LazyVim in the overrides.lua file. 

## Installation
To use this configuration (I don't recommend this, make your own)(this probably won't work for you anyway), just clone the repo into your `~/.config/nvim `folder. If you don't know how to do that, you shouldn't be using this in the first place. If you're using Windows, stop. Use WSL and do everything from there.

> **Note**: If you do end up cloning this repo to use it, the jdtls (java) LSP will NOT WORK unless you install the correct things and specify the paths to the correct things in the ftplugin/java.lua file. This took way too long to set up so if you do want to do this I will not help you. Good luck. Sorry. Why are you using java anyway.

## Additional Notes
vim
