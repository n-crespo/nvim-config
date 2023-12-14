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

- the <80 ms startup time
  - see the last 2 auto commands in [here](./lua/config/autocmds.lua) (fixing vim's slow clipboard)
- the spider plugin
- the transparent One Dark Pro theme that I slightly changed
- the mini.files plugin
- the **functional** LSPs/formatters I've set up for Java, C++, Markdown, and R-Markdown
- the markdown table plugin
- all of [these keymaps](lua/config/keymaps.lua)
- the headlines.nvim plugin
- the scrollEOF plugin
- the mini.ai plugin
- the Rnvimr (ranger) plugin

> [!Note]
> Many of the plugins I use are not visible in lua/plugins/ because I
> use the lazyvim configuration which comes with lots of plugins. You can see
> these in the [LazyVim repo](https://github.com/LazyVim/LazyVim). I also have
> disabled some plugins that come with LazyVim in the `overrides.lua` file.

To use this configuration (I don't recommend this, make your own)(it probably
won't fully work for you anyway)(you're better off starting your own config and
stealing the chunks that you actually need), just clone the repo into your
`~/.config/nvim` folder. If you don't know how to do that, you shouldn't be
using this in the first place. If you're using Windows, stop. Use WSL and do
everything from there. (I have tested this on Windows, and it does work, but it
is significantly slower and less enjoyable to use.)
