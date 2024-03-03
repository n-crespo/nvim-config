-- Use <enter> to follow markdown links (or hyperlinks), <C-k> in insert mode
-- to create links, <zh> to fold headers. Good. Kinda buggy and not maintained
-- but good
return {
  {
    "n-crespo/nvim-markdown",
    ft = "markdown",
    keys = {
      { "<leader>t", "<cmd>Toc<cr><cmd>set nornu<cr><cmd>set nonu<cr>", desc = "Table of Contents" },
    },
    config = function()
      vim.cmd([[let g:vim_markdown_math = 1]])
      vim.g.vim_markdown_toc_autofit = 1
      vim.cmd([[map zh <Plug>Markdown_Fold]])
      vim.cmd([[map <Plug> <Plug>Markdown_CreateLink]])
    end,
  },
  {
    "tadmccorkle/markdown.nvim",
    lazy = true,
    ft = { "markdown" },
    opts = {
      mappings = {
        inline_surround_toggle = "gs", -- (string|boolean) toggle inline style
        inline_surround_toggle_line = "gss", -- (string|boolean) line-wise toggle inline style
        inline_surround_delete = "ds", -- (string|boolean) delete emphasis surrounding cursor
        inline_surround_change = "cs", -- (string|boolean) change emphasis surrounding cursor
        link_add = "gl", -- (string|boolean) add link
        -- link_follow = "gx", -- (string|boolean) follow link
        link_follow = "<CR>", -- (string|boolean) follow link
        go_curr_heading = "]c", -- (string|boolean) set cursor to current section heading
        go_parent_heading = "]p", -- (string|boolean) set cursor to parent section heading
        go_next_heading = "]]", -- (string|boolean) set cursor to next section heading
        go_prev_heading = "[[", -- (string|boolean) set cursor to previous section heading
      },
      inline_surround = {
        emphasis = {
          key = "i",
          txt = "*",
        },
        strong = {
          key = "b",
          txt = "**",
        },
        strikethrough = {
          key = "s",
          txt = "~~",
        },
        code = {
          key = "c",
          txt = "`",
        },
      },
      link = {
        paste = {
          enable = true, -- whether to convert URLs to links on paste
        },
      },
      toc = {
        -- Comment text to flag headings/sections for omission in table of contents.
        omit_heading = "toc omit heading",
        omit_section = "toc omit section",
      },
      -- Hook functions allow for overriding or extending default behavior.
      hooks = {
        follow_link = "dest", -- nil
      },
    },
  },
}
