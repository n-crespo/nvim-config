# Neovim Configuration

My Neovim configuration based on the [LazyVim](https://www.lazyvim.org)
distribution, with custom features to extend/remove unneeded functionality.

![image](./images/image.png)

Some cool things in here are:

- my minimal [lualine](./lua/plugins/lualine.lua) config
- my [mini.files config](./lua/plugins/mini-files.lua)
- my [utility functions](./lua/custom/utils.lua)
- my custom (borrowed/extended) [color scheme](./colors/macro.lua)
- [my markdown config](./lua/plugins/markdown.lua)
  - follow all types of links with `<CR>`
  - render things nicely, generate TOC, etc
- [my auto commands](./lua/config/autocmds.lua) and [keymaps](./lua/config/keymaps.lua)
  - remove trailing white space on save
  - only show cursor line in active window
  - `<C-l>` in insert mode to auto fix last spelling error
  - `E` and `B` instead of `0` and `$` (wrap friendly)
  - Shift modifiers for window navigation commands work through terminal mode
  - increment/decrement numbers with `+` and `-`
  - `<C-S-C>` to get word count
  - `<C-S-S>` to clean Windows generated `^M` chars
- [nvim-spider](./lua/plugins/spider.lua) for better 'w', 'e', and 'b' motions
- my snacks.nvim [picker](./lua/plugins/picker.lua) and [terminal](./lua/plugins/terminal.lua) config
  - integration with zoxide
- ~31ms startup time

# Install

> [!WARNING]
> see [my dotfiles](https://www.github.com/n-crespo/dotfiles) for full system requirements

- `neovim` (>=0.11 preferred)
- `gcc`
- `python`
- `go`
- `lazygit`
- `clang`
- `node`
- `ripgrep`/`rg`
- `wslu` (if using WSL)
- `xclip` (if using WSL)
- `npm` (for some language servers)

## Install Instructions

### Debian

```bash
sudo apt-get install -y neovim
sudo apt-get install python3-neovim
```

For nightly (not needed):

```bash
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim # just do this line to get stable version
```

### Homebrew on macOS or Linux

```bash
brew install neovim # add --HEAD to install nightly (not needed)
```

## Usage

Clone the repository and install the plugins:

```bash
# this will not override any current neovim configuration files
git clone git@github.com:n-crespo/nvim-config ~/.config/n-crespo/nvim-config
#                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#             change this install path to ~/.config/nvim to override current config
NVIM_APPNAME=n-crespo/nvim-config/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim (if using custom install path):

```bash
NVIM_APPNAME=n-crespo/nvim-config/ nvim
```
