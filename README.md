# Neovim Configuration

My Neovim configuration based on [LazyVim](https://www.lazyvim.org), with added
plugins and to extend functionality.

![start screen](./images/image.png)

## Cool Things

Some cool things in this config are:

- my [custom tabline lualine component](./lua/plugins/lualine.lua) (see `opts.sections.lualine_x`)
- [mini.files](https://github.com/echasnovski/mini.files)
- [nvim-spider](https://github.com/chrisgrieser/nvim-spider) - better `w`, `e`, and `b`
- [(not) my color scheme](./colors/macro.lua)
- [flatten.nvim](https://github.com/willothy/flatten.nvim)
- [all my auto commands](./lua/config/autocmds.lua)
- [this markdown config](./lua/plugins/markdown.lua) (mostly LazyVim)
- my [auto commands](./lua/config/autocmds.lua)
  - only show cursor line in active window
  - remove trailing white space on save

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
