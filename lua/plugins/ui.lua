return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      highlights = {
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    },
    keys = {
      { "<C-p>", "<cmd>BufferLinePick<cr>", desc = "[P]ick Buffer" },
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {
        function()
          return " " .. os.date("%I:%M %p")
        end,
      }
    end,
  },
  {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost", -- later or on keypress would prevent saving folds
    opts = true, -- needed even when using default config
  },
  {
    "echasnovski/mini.indentscope",
    -- version = false,  wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
      draw = { delay = 0, animation = require("mini.indentscope").gen_animation.none() },
    },
  },
}
