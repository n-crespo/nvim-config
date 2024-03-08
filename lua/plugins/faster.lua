-- disable some stuff when opening big files
return {
  "pteroctopus/faster.nvim",
  event = "LazyFile",
  opts = {
    -- Behaviour table contains configuration for behaviours faster.nvim uses
    behaviours = {
      -- Bigfile configuration controls disabling and enabling of features when
      -- big file is opened
      bigfile = {
        -- Behaviour can be turned on or off. To turn on set to true, otherwise
        -- set to false
        on = true,
        -- Table which contains names of features that will be disabled when
        -- bigfile is opened. Feature names can be seen in features table below.
        -- features_disabled can also be set to "all" and then all features that
        -- are on (on=true) are going to be disabled for this behaviour
        features_disabled = {
          -- "illuminate",
          "matchparen",
          "lsp",
          "treesitter",
          "lualine",
          "indent_blankline",
          "vimopts",
          "syntax",
          "filetype",
        },
        -- Files larger than `filesize` are considered big files. Value is in MB.
        filesize = 0.5,
        -- Autocmd pattern that controls on which files behaviour will be applied.
        -- `*` means any file.
        pattern = "*",
      },
      -- Fast macro configuration controls disabling and enabling features when
      -- macro is executed
      fastmacro = {
        -- Behaviour can be turned on or off. To turn on set to true, otherwise
        -- set to false
        on = true,
        -- Table which contains names of features that will be disabled when
        -- macro is executed. Feature names can be seen in features table below.
        -- features_disabled can also be set to "all" and then all features that
        -- are on (on=true) are going to be disabled for this behaviour.
        -- Specificaly: lualine plugin is disabled when macros are executed because
        -- if a recursive macro opens a buffer on every iteration this error will
        -- happen after 300-400 hundred iterations:
        -- `E5108: Error executing lua Vim:E903: Process failed to start: too many open files: "/usr/bin/git"`
        features_disabled = { "lualine" },
      },
    },
    -- Feature table contains configuration for features faster.nvim will disable
    -- and enable according to rules defined in behaviours.
    -- Defined feature will be used by faster.nvim only if it is on (`on=true`).
    -- Defer will be used if some features need to be disabled after others.
    -- defer=false features will be disabled first and defer=true features last.
    -- features = {
    --   -- Neovim filetype plugin
    --   -- https://neovim.io/doc/user/filetype.html
    --   filetype = {
    --     on = false,
    --     defer = true,
    --   },
    --   -- Indent Blankline
    --   -- https://github.com/lukas-reineke/indent-blankline.nvim
    --   indent_blankline = {
    --     on = false,
    --     defer = false,
    --   },
    --   -- Neovim LSP
    --   -- https://neovim.io/doc/user/lsp.html
    --   lsp = {
    --     on = false,
    --     defer = false,
    --   },
    --   -- Lualine
    --   -- https://github.com/nvim-lualine/lualine.nvim
    --   lualine = {
    --     on = false,
    --     defer = false,
    --   },
    --   -- Neovim Pi_paren plugin
    --   -- https://neovim.io/doc/user/pi_paren.html
    --   matchparen = {
    --     on = false,
    --     defer = false,
    --   },
    --   -- Neovim syntax
    --   -- https://neovim.io/doc/user/syntax.html
    --   syntax = {
    --     on = false,
    --     defer = true,
    --   },
    --   -- Neovim treesitter
    --   -- https://neovim.io/doc/user/treesitter.html
    --   treesitter = {
    --     on = false,
    --     defer = false,
    --   },
    --   -- Neovim options that affect speed when big file is opened:
    --   -- swapfile, foldmethod, undolevels, undoreload, list
    --   vimopts = {
    --     on = true,
    --     defer = false,
    --   },
    -- },
  },
}
