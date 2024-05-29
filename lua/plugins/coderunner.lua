-- use R to run any file! very nice
-- this overrides the vim native replace mode, which i never use
return {
  "CRAG666/code_runner.nvim",
  event = "LazyFile",
  config = true,
  opts = {
    project_path = vim.fn.expand("~/.config/nvim/project_manager.json"),
    mode = "term",
    startinsert = false,
    filetype = {
      python = "python3 -u '$dir/$fileName'",
      javascript = "node",
      html = "cd $dir && live-server --browser=/mnt/c/Program\\ Files/Mozilla\\ Firefox/firefox.exe",
      java = "cd $dir && javac $fileName -d bin/ && java -cp $dir/bin/ $fileNameWithoutExt",
      cpp = {
        "cd $dir &&",
        "g++ $fileName",
        "-o /tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt",
      },
    },
    project = {
      ["~/grade%-12/csa/2/AmusementPark/src/.-"] = {
        name = "Amusement Park",
        description = "Amusement Park Game",
        -- javac */java -d bin/ && java -cp bin/ src.Main
        command = "rjall",
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
    { "R", "<cmd>RunCode<cr>", desc = "Run Code" },
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
