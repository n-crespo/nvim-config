# Neovim Configuration

My Neovim configuration based on the [LazyVim](https://www.lazyvim.org)
distribution, with custom features to extend/remove unneeded functionality.

![image](./images/image.png)

Some cool things in here are:

- my custom (borrowed/extended) [color scheme](./colors/macro.lua)
- my custom [lualine](./lua/plugins/lualine.lua) config
- [my markdown config](./lua/plugins/markdown.lua) which allows for
  - following all types of links with `<CR>`
  - rendering things nicely, generate TOC, more
- [my auto commands](./lua/config/autocmds.lua) and [keymaps](./lua/config/keymaps.lua)
  - remove trailing white space on save
  - only show cursor line in active window (like reticle.nvim but in 15 LOC)
  - `<C-l>` in insert mode to auto fix last spelling error
  - `E` and `B` instead of `0` and `$` (wrap friendly)
  - Shift modifiers for window navigation commands to work through terminal mode
  - increment/decrement numbers with `+` and `-`
  - `<C-S-C>` to get word count
  - `<C-S-S>` to clean Windows generated `^M` chars (when editing from WSL land)
- [mini.files](./lua/plugins/mini-files.lua), the best explorer
- [nvim-spider](./lua/plugins/spider.lua) for better `w`, `e`, and `b` motions
- my snacks.nvim [picker](./lua/plugins/picker.lua) and [terminal](./lua/plugins/terminal.lua) config
  - with great integration with zoxide
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
