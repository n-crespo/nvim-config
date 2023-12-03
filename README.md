# My Neovim Config

## Description

My neovim config based on [LazyVim](https://www.lazyvim.org), with added
plugins, LSPs, and keymaps.

If you don't understand how this works, you probably
shouldn't use this configuration. First check out lazyvim, NvChad, or
kickstart.nvim, and understand how plugins, keymaps, LSPs, and the rest of the
config works.

## Interesting Things

My favorite things about this configuration are (in no particular order):

- the One Dark Pro theme that I slightly changed
- the Rnvimr (ranger) plugin
- the markdown table plugin
- the headlines.nvim plugin
- the mini.files plugin
- the mini.ai plugin
- the **functional** LSPs/formatters set up for Java, C++, Markdown, and
  R-Markdown
- the spider plugin
- the scrollEOF plugin
- the mini surround plugin
- all of [these keymaps](lua/config/keymaps.lua)

> **Note**: many of the plugins I use are not visible in lua/plugins/ because I
> use the lazyvim configuration which comes with lots of plugins. You can see
> these in these in the [LazyVim repo](https://github.com/LazyVim/LazyVim). I
> also have disabled some plugins that come with LazyVim in the `overrides.lua`
> file.

To use this configuration (I don't recommend this, make your own)(this probably
won't work for you anyway), just clone the repo into your `~/.config/nvim`
folder. If you don't know how to do that, you shouldn't be using this in the
first place. If you're using Windows, stop. Use WSL and do everything from
there.
