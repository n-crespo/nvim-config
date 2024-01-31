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
      ["<Leader>b"] = { name = "+buffer" },
      ["<Leader>c"] = { name = "+code" },
      ["<Leader>f"] = { name = "+find" },
      ["<Leader>g"] = { name = "+git" },
      ["<Leader>l"] = { name = "+lazy" },
      ["<Leader>s"] = { name = "+search" },
      ["<Leader>u"] = { name = "+ui" },
      ["<Leader>w"] = { name = "+window" },
      ["<R>"] = { name = "+Run" },
      ["<Leader>q"] = { name = "+sessions" },
      ["<Leader>r"] = { name = "+r markdown" },
      ["<Leader>rk"] = { name = "+knit" },
      ["<Leader>x"] = { name = "+quickfix" },
      ["<Leader><Tab>"] = { name = "+tab" },
      ["<Leader>"] = { name = "+leader" },
      ["<Leader>sn"] = { name = "+noice" },
      ["<Leader>gh"] = { name = "+hunk" },
      ["<LocalLeader>"] = { name = "+leader" },
      ["<Leader>o"] = { name = "+open" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
    },
  },
}
