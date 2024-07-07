# Neovim Configuration

My Neovim configuration based on [LazyVim](https://www.lazyvim.org), with added plugins and LSPs to extend its
functionality.

![start screen](./images/image.png)

## Interesting Things

Some interesting things in this config are:

- the keymaps and abbreviations in [keymaps.lua](./lua/config/keymaps.lua)
- ~30 ms startup time (lazy load everything)
- [my custom color scheme](./colors/macro.lua)
  - 90% stolen from [this dude](https://github.com/Bekaboo/nvim/blob/master/colors/macro.lua), 10% my own
  - intentionally avoids the use of bright red and yellow (reserved for errors)
- [spider](https://github.com/chrisgrieser/nvim-spider)
  - better `w`, `e`, and `b`
- [mini.files](https://github.com/echasnovski/mini.files)
  - better version of oil.nvim
- [flatten.nvim](https://github.com/willothy/flatten.nvim)
  - stops nested nvim instances
  - amazing when used with autojump and betterTerm
- [peek.nvim](https://github.com/toppair/peek.nvim)
  - a fairly simple markdown preview plugin that works well with WSL
- [smart-open.nvim](https://github.com/danielfalk/smart-open.nvim)
  - smartly opens files
- my [custom lualine component](./lua/plugins/lualine.lua) that replaces the tabline
  - see `opts.sections.lualine_x`
- my [NeoCodeium](./lua/plugins/neocodeium.lua) config
- [all my auto commands](./lua/config/autocmds.lua)
  - only show cursor line in active window
  - remove trailing white space on save
- I have successfully replaced `<C-n>` and `<C-p>` with `<C-j>` and `<C-k>` _everywhere_
- my [custom markdown highlights](./after/queries/markdown/highlights.scm) for bullets and checkboxes in markdown

> [!NOTE]\
> Many of the plugins I use are not visible in `lua/plugins/` because I use the
> LazyVim distribution which already comes with lots of plugins. I have disabled
> some plugins that come with LazyVim in the [overrides.lua](./lua/plugins/overrides.lua) file.

## Install Instructions

> Install requires Neovim 0.9+.

Clone the repository and install the plugins:

```
git clone git@github.com:n-crespo/nvim-config ~/.config/n-crespo/nvim-config
NVIM_APPNAME=n-crespo/nvim-config/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```
NVIM_APPNAME=n-crespo/nvim-config/ nvim
```
