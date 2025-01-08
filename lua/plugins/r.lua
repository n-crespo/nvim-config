return {
  "R-nvim/R.nvim",
  ft = { "r", "rmarkdown", "rmd" },
  lazy = true,
  opts = {
    pipe_keymap = "",
    R_args = { "--quiet", "--no-save" },
    disable_cmds = {
      "RSaveClose",
      "RCustomStart",
      "RSweave",
      "RMakeODT",
      "RMakeWord",
      "RKnitRmCache",
      "RMakeAll",
      "RMakePDFKb",
      "RQuartoPreview",
      "RBibTeXK",
      "RBibTeX",
      "RQuartoStop",
      "RSeparatePathHere",
      "RShowEx",
      "RSeparatePathPaste",
      "RShowArgs",
      "RSummary",
      "RObjectNames",
      "RObjectStr",
      "RSPlot",
      "RSetwd",
      "RClearAll",
      "RShowRout",
      "RListSpace",
      "RObjectPr",
      "RPlot",
      "RSendLine",
      "RSendAllFun",
      "RSendCurrentFun",
      "RFormatNumbers",
      "RFormatSubsetting",
      "RSendChain",
      "RNLeftPart",
      "RNLeftPart",
      "RILeftPart",
      "RSendParagraph",
      "RDSendMBlock",
      "RDSendCurrentFun",
      "RDSendSelection",
      "RInsertLineOutput",
      "RIRightPart",
      "RDSendChunk",
      "RNRightPart",
      "RSendMotion",
      "RSendLAndOpenNewOne",
      "RSendMBlock",
      "RNextRChunk",
      "RPreviousRChunk",
      "ROBOpenLists",
      "ROBCloseLists",
      "RDSendParagraph",
      "RViewDFs",
      "RDputObj",
      "ROBToggle", -- object browser (?)
      "RSendSelection",
    },
    hook = {
      on_filetype = function()
        -- This function will be called at the FileType event of files supported by R.nvim.
        -- This is an opportunity to create mappings local to buffers.
        vim.keymap.set("n", "<CR>", "<Plug>RDSendLine", { buffer = true })
        vim.keymap.set("n", "<leader>d", "yydd", { desc = "Delete to Paste Register", silent = true, buffer = true })

        -- Increase the width of which-key to handle the longer r-nvim descriptions local wk = require("which-key")
        -- Workaround from https://github.com/folke/which-key.nvim/issues/514#issuecomment-1987286901
        require("which-key").add({
          { "<leader>c", group = "code/chunks" },
          { "<leader>r", group = "r general" },
          { "<leader>v", group = "view" },
        })
      end,
    },
    pdfviewer = "",
  },
}
