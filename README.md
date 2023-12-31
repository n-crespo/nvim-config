
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

- the <25 ms startup time (more like 60ms in regular Windows)
  - see the last 2 auto commands in [here](./lua/config/autocmds.lua) (fixing vim's slow clipboard in WSL)
- these plugins: 
  - spider (better `w`, `e`, and `b`)
  - origami (better folding)
  - mini.files less intrusive version of oil.nvim)
  - indent scope (with an instant animation)
  - one dark pro (transparent + italic comment)
  - highlight undo
  - code_runner
  - better term
  - the 90% of lazyvim that I don't have disabled

> [!Note]
> Many of the plugins I use are not visible in `lua/plugins/` because I use the
> lazyvim configuration which already comes with lots of plugins. You can see
> these in the [LazyVim repo](https://github.com/LazyVim/LazyVim). I also have
> disabled some plugins that come with LazyVim in the `./lua/plugins/overrides.lua` file.

To use this configuration (I don't recommend this, make your own)(it probably
won't fully work for you anyway)(you're better off starting your own config and
stealing the chunks that you actually need), just clone the repo into your
`~/.config/nvim` folder. If you don't know how to do that, you shouldn't be
using this in the first place. 

If you're using Windows, stop. Use WSL and be happy.
