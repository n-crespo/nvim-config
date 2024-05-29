return {
  "R-nvim/R.nvim",
  lazy = false,
  opts = {
    -- Create a table with the options to be passed to setup()
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
      -- "RMakePDFK",
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
      "RSendSelection",
      "RSendLAndOpenNewOne",
      "RSendMBlock",
      "RNextRChunk",
      "RPreviousRChunk",
      "ROBOpenLists",
      "ROBCloseLists",
      "RDSendParagraph",
      "RViewDFs",
      "RDputObj",
      "RDSendLine",
      "RPipe",
    },
    hook = {
      on_filetype = function()
        -- This function will be called at the FileType event
        -- of files supported by R.nvim. This is an
        -- opportunity to create mappings local to buffers.
        vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine", { buffer = true })
        vim.keymap.del("i", "<space>,", { buffer = true }) -- RPipe not being deleted properly
        vim.keymap.set("v", "<Enter>", "<Plug>RSendSelection", { buffer = true })

        -- Increase the width of which-key to handle the longer r-nvim descriptions
        local wk = require("which-key")
        -- Workaround from https://github.com/folke/which-key.nvim/issues/514#issuecomment-1987286901
        wk.register({
          ["<localleader>"] = {
            a = nil,
            c = { name = "+code/chunks", ["🚫"] = "which_key_ignore" },
            k = { name = "+knit", ["🚫"] = "which_key_ignore" },
            r = { name = "+r", ["🚫"] = "which_key_ignore" },
            v = { name = "+view", ["🚫"] = "which_key_ignore" },
          },
        })
      end,
    },
    pdfviewer = "",
  },
}