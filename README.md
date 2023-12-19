
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

- the <40 ms startup time (even on regular Windows !)
  - see the last 2 auto commands in [here](./lua/config/autocmds.lua) (fixing vim's slow clipboard)
  - see the vim-startuptime plugin
- the spider plugin (better `w`, `e`, and `b`)
- the mini.files plugin (better vesion of oil.nvim)
- the mini.ai plugin (text objects)
- the indent.blankline plugin (with an instant animation)
- the **functional** LSPs and formatters I've set up for Java, C++, Markdown, R-Markdown, and Shell
- the headlines.nvim plugin (highlighted code blocks and markdown headers)
- persistent code sessions (LazyVim default plugin)
- my transparent one dark pro theme

> [!Note]
> Many of the plugins I use are not visible in `lua/plugins/` because I use the
> lazyvim configuration which already comes with lots of plugins. You can see
> these in the [LazyVim repo](https://github.com/LazyVim/LazyVim). I also have
> disabled some plugins that come with LazyVim in the `overrides.lua` file.

To use this configuration (I don't recommend this, make your own)(it probably
won't fully work for you anyway)(you're better off starting your own config and
stealing the chunks that you actually need), just clone the repo into your
`~/.config/nvim` folder. If you don't know how to do that, you shouldn't be
using this in the first place. 

If you're using Windows, stop. Use WSL and be happy.
