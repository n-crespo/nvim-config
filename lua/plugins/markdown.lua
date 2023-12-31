-- collection of plugins for markdown support in vim
return {
  {
    -- use <enter> to follow markdown links, <C-k> in insert mode to create
    -- links, <tab> to fold headers, <leader>mc for table of contents
    "ixru/nvim-markdown",
    config = function()
      -- markdown table of contents
      vim.keymap.set(
        "n",
        "<leader>mc",
        "<CMD>Toc<CR><CMD>set nornu<CR><cmd>set nonu<cr>",
        { silent = true, desc = "[C]ontents" }
      )
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_toc_autofit = 1
    end,
  },
  {
    -- auto format and align markdown tables
    "dhruvasagar/vim-table-mode",
    config = function()
      -- support for markdown table mode
      vim.keymap.set("n", "<leader>mt", "<CMD>TableModeToggle<CR>", { silent = true, desc = "Table Mode [T]oggle" })
      -- these are dumb
      vim.keymap.del("v", "<leader>T")
      vim.keymap.del("v", "<leader>tt")
      vim.keymap.del("n", "<leader>tt")
      vim.keymap.del("n", "<leader>tm")
    end,
  },
  {
    -- <leader>op (open preview) to open scroll synchronized markdown preview window
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>op",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    -- highlight markdown headings and codeblocks (can get laggy)
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {},
          -- i think these are too fat (check wikipedia unicode)
          -- fat_headline_upper_string = "▄",
          -- line for visual separation
          -- fat_headline_lower_string = "▀",
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },
}
