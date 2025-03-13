return {
  {
    "folke/persistence.nvim",
    enabled = not LazyVim.is_win(),
    opts = {
      pre_save = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
      end,
    },
    keys = {
      { "<leader>qs", false },
      { "<leader>ql", false },
      { "<leader>qd", false },
      { "<leader>qS", false },
    },
  },
  -- https://github.com/LazyVim/LazyVim/discussions/5462
  {
    "folke/persistence.nvim",
    lazy = false,
    opts = function()
      -- Auto restore session
      vim.api.nvim_create_autocmd("VimEnter", {
        nested = true,
        callback = function()
          local persistence = require("persistence")
          if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            persistence.load()
            -- else
            -- persistence.stop()
          end
        end,
      })
      -- Auto delete [No Name] buffers.
      vim.api.nvim_create_autocmd("BufLeave", {
        callback = function()
          local buffers = vim.fn.filter(
            vim.fn.range(1, vim.fn.bufnr("$")),
            'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])'
          )
          local next = next
          if next(buffers) == nil then
            return
          end
          local cmdstr = ":silent! bw!"
          for _, v in pairs(buffers) do
            cmdstr = cmdstr .. " " .. v
          end
          vim.cmd(cmdstr)
        end,
      })
    end,
  },
}
