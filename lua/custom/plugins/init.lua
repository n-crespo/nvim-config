-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'monkoose/neocodeium',
    event = 'VeryLazy',
    config = function()
      local neocodeium = require 'neocodeium'
      neocodeium.setup()
      vim.keymap.set('i', '<A-f>', neocodeium.accept)
    end,
  },
}
