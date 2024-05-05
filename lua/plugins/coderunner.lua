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
    { "RJ", "<cmd>RunClose<cr><cmd>RunFile term<cr>", desc = "Run Code Below" }, -- J --> down --> bottom split
    { "RL", "<cmd>RunClose<cr><cmd>RunFile term<cr><cmd>windo wincmd H<cr>", desc = "Run Code on Left" }, -- J --> down --> bottom split
    { "RQ", "<cmd>RunClose<cr><cmd>RunClose<cr>", desc = "Close Runner" }, -- J --> down --> bottom split
  },
  init = function()
    -- Close Code Runner buffers with 'q'
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "crunner",
      callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
      end,
    })
  end,
}
