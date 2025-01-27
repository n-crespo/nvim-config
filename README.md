# Neovim Configuration

My Neovim configuration based on [LazyVim](https://www.lazyvim.org), with added
plugins and to extend functionality.

![start screen](./images/image.png)

## Cool Things

Some cool things in this config are:

- my [custom tabline](./lua/custom/tabline.lua) and minimal [lualine](./lua/plugins/lualine.lua) config
- my [mini.files config](https://github.com/echasnovski/mini.files)
- better word motions with [nvim-spider](https://github.com/chrisgrieser/nvim-spider)
- my custom (borrowed/extended) [color scheme](./colors/macro.lua)
- [flatten](https://github.com/willothy/flatten.nvim) nested neovim instances
  - super useful when used with the Snacks terminal + zoxide + fzf
- [all my auto commands](./lua/config/autocmds.lua) and [keymaps](./lua/config/keymaps.lua)
  - remove trailing white space on save
  - only show cursor line in active window
  - `<C-l>` in insert mode to auto fix last spelling error
  - `E` and `B` instead of `0` and `$` (wrap friendly)
  - Shift modifiers for window nav commands works through terminal mode
  - increment/decrement numbers with `+` and `-`
  - `<C-S-C>` to get word count
  - `<C-S-S>` to clean Windows generated `^M` chars
- [my markdown config](./lua/plugins/markdown.lua)
  - follow all types of links with Enter
  - render things nicely, generate TOC, etc
- my snacks.nvim [picker](./lua/plugins/picker.lua) and [terminal](./lua/plugins/terminal.lua) config
- the ~31ms startup time

> [!NOTE]
> Many of the plugins I use are not visible in `lua/plugins/` because I use the
> LazyVim distribution which already comes with lots of plugins. I have disabled
> some plugins that come with LazyVim in the [overrides.lua](./lua/plugins/overrides.lua) file.

## Dependencies

> [!WARNING]
> see [my dotfiles](https://www.github.com/n-crespo/dotfiles) for full system requirements

- gcc
- python
- clang
- node
- go
- ripgrep
- lazygit
- wslu (if using WSL)

## Install Instructions

> [!WARNING]
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
