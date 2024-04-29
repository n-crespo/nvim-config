-- use R to run any file! very nice
-- this overrides the vim native replace mode, which i never use
return {
  "n-crespo/code_runner.nvim",
  event = "LazyFile",
  dependencies = {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<R>"] = { name = "+Run" },
      },
    },
  },
  config = true,
  opts = {
    mode = "term",
    startinsert = false,
    filetype = {
      python = "python -u '$dir/$fileName'",
      javascript = "node",
      java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
      cpp = {
        "cd $dir &&",
        "g++ $fileName",
        "-o /tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt",
      },
    },
    term = {
      position = "bot", -- horiz, top, vert
      size = 18,
    },
    float = {
      border = "single",
      close_key = "<ESC>",
      blend = 0,
    },
  },
  keys = {
    {
      "RB", -- run in better term
      function()
        require("betterTerm").send(require("code_runner.commands").get_filetype_command(), 1, false)
      end,
      desc = "Run Code",
    },
    { "RJ", "<cmd>RunFile term<cr>", desc = "Run Code Below" }, -- J --> down --> bottom split
    { "RL", "<cmd>RunFile term<cr><cmd>windo wincmd H<cr>", desc = "Run Code on Left" }, -- J --> down --> bottom split

    -- vim.keymap.set("n", "<leader>e", function()
    --   require("betterTerm").send(require("code_runner.commands").get_filetype_command(), 1, false)
    -- end, { desc = "Excute File" }),
  },
  init = function()
    -- Close Code Runner buffers with 'q'
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "crunner",
      callback = function(event)
        vim.cmd([[echo 'crunner detected']])
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
      end,
    })
  end,
}
