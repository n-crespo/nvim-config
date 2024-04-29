# Neovim Configuration

<a href="https://dotfyle.com/n-crespo/nvim-config"><img src="https://dotfyle.com/n-crespo/nvim-config/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/n-crespo/nvim-config"><img src="https://dotfyle.com/n-crespo/nvim-config/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/n-crespo/nvim-config"><img src="https://dotfyle.com/n-crespo/nvim-config/badges/plugin-manager?style=flat" /></a>

My Neovim configuration based on [LazyVim](https://www.lazyvim.org), with added plugins and LSPs to extend its
functionality. Every configuration was done with transparency in mind.

![start screen](./images/image.png)

## Interesting Things

Some interesting things in this config are:

- the keymaps in [keymaps.lua](./lua/config/keymaps.lua)
- the ~30 ms startup time
  - see the first 2 auto commands in [here](./lua/config/autocmds.lua) to speed up WSL
- the following plugins:
  - [codeium](https://github.com/Exafunction/codeium.vim) (free and open source code completion) (installed with `:LazyExtras`)
  - [spider](https://github.com/chrisgrieser/nvim-spider) (better `w`, `e`, and `b`)
  - [mini.files](https://github.com/echasnovski/mini.files) (less intrusive version of oil.nvim)
  - [flatten.nvim](https://github.com/willothy/flatten.nvim) (no more nested nvim instances, amazing when used with autojump and betterTerm)
  - [onedarkpro](https://github.com/olimorris/onedarkpro.nvim) (transparent everything + super customizable)
- the LSP and formatter support for R-Markdown, C++, Java, and Python (mostly thanks to LazyVim)
  - see `markdown.lua`, `markdownpreview.lua`, and `markdowntable.lua` for markdown (no LSP needed)
- I have successfully replaced `<C-n>` and `<C-p>` with `<C-j>` and `<C-k>` _everywhere_
- custom markdown highlights for bullets, checkboxes, and inline quotes

> [!Note]
> Many of the plugins I use are not visible in `lua/plugins/` because I
> use the LazyVim distribution which already comes with lots of plugins. You can
> see these in the [LazyVim repo](https://github.com/LazyVim/LazyVim). I also
> have disabled some plugins that come with LazyVim in the
> [overrides.lua](./lua/plugins/overrides.lua) file.

## Structure

This configuration is structured so that all plugin configurations are in the
`./lua/plugins/` folder, with each plugin having its own file. This way, I can
remove a plugin by just deleting its file. See below:

<details>
  <summary><b>Relevant File Structure</b></summary>

```
.
├── lua
│  ├── config
│  │  ├── autocmds.lua
│  │  ├── keymaps.lua
│  │  ├── lazy.lua
│  │  └── options.lua
│  ├── plugins
│  │  ├── {plugin}.lua
│  │  └── ...
│  └── transparentlualine.lua
├── init.lua
└── README.md
```

</details>

## Install Instructions

> Install requires Neovim 0.9+.

Clone the repository and install the plugins:

```sh
git clone git@github.com:n-crespo/nvim-config ~/.config/n-crespo/nvim-config
NVIM_APPNAME=n-crespo/nvim-config/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=n-crespo/nvim-config/ nvim
```

## TODO

- [x] Fix transparent completion window
- [x] Edit Treesitter highlighting for markdown checkboxes
- [x] bordered floating window
- [x] bordered floating terminal
- [x] `require({})` less
- [x] transparent Lualine
- [x] transparent LSP and save dialogues (bottom right)
- [x] `<C-j>` and `<C-k>` for cycling completions
  - [x] in Telescope
  - [x] in command line popup
  - [x] in code completions
- [x] image previews in telescope
- [x] delete buffers through telescope
- [x] Fix Shift+Tab in markdown files
- [x] fix completion window highlights
- [x] fix mini.files path not found errors
- [x] escape to close telescope immediately
- [x] fix `[Process exited 0]` when quit terminal
- [x] fix `<Tab>` keymap conflicts due to markdown plugin
- [x] vertical lualine separators?
- [x] better spell check for markdown (ignore inline html + links + code blocks)
- [x] window labels when split buffers
- [x] better tab management
- [x] better close/open tab mappings
- [x] conceal chars in markdown
  - [x] checkboxes
    - [x] done
    - [x] not done
  - [x] bullet points
  - [x] single line quotes
  - [x] block quotes (back to using headlines.nvim)
- [x] format visual selection in markdown (bold + italic)
- [x] code block insertion in insert mode
- [x] better markdown latex previews
- [x] command line completion (probably going to skip this one...)
  - [x] `:Telescope commands` (`<leader>:`)
- [x] smaller cmp window
- [x] deal with trailing white space better (auto command)
- [x] better spelling? (`spell.lua`)
- [x] telescope layout/open files picker
- [x] inline image previews in markdown (switched to kitty)
- [x] headlines but not slow (kitty again)
- [x] window labels (incline)
- [x] fix MacOS scrolling
  - [x] System specific settings in lua
- [x] find tabline replacement
- [x] Conceal dollar signs in markdown math
- [x] multi-cursors
- [x] better theme (less red, reserve for errors)
  - [x] easily customizable
  - [x] Treesitter support
  - [x] highlight misspelled words red/underlined
