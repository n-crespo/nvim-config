-- default LazyVim plugin, adds floating window for remembering keymaps
-- config adds more keymaps, enables spelling, marks, registers
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      border = "rounded",
      padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    },
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 25, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["<Leader>b"] = { name = "+Buffer" },
      ["<Leader>c"] = { name = "+Code" },
      ["<Leader>f"] = { name = "+Find" },
      ["<Leader>g"] = { name = "+Git" },
      ["<Leader>l"] = { name = "+Lazy" },
      ["<Leader>s"] = { name = "+Search" },
      ["<Leader>u"] = { name = "+UI" },
      ["<Leader>w"] = { name = "+Window" },
      ["<R>"] = { name = "+Run" },
      ["<Leader>q"] = { name = "+Sessions" },
      ["<Leader>r"] = { name = "+R Markdown" },
      ["<Leader>rk"] = { name = "+Knit" },
      ["<Leader>x"] = { name = "+Quickfix" },
      ["<Leader><Tab>"] = { name = "+Tab" },
      ["<Leader>"] = { name = "+Leader" },
      ["<Leader>sn"] = { name = "+Noice" },
      ["<Leader>gh"] = { name = "+Hunk" },
      ["<LocalLeader>"] = { name = "+Leader" },
      ["<Leader>o"] = { name = "+Open" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
    },
  },
}
