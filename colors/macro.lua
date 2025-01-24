-- Name:         macro
-- Description:  Colorscheme for MΛCRO Neovim inspired by kanagawa-dragon @rebelot and mellifluous @ramojus
-- Author:       Bekaboo <kankefengjing@gmail.com>
-- Maintainer:   Bekaboo <kankefengjing@gmail.com>
-- License:      GPL-3.0
-- Last Updated: 2024-12-29 13:30

-- NOTE; this intentionally avoids the use of bright red and yellow (reserved for errors)

-- Clear hlgroups and set colors_name {{{
vim.cmd.hi("clear")
vim.g.colors_name = "macro"
-- }}}

-- {{{
-- stylua: ignore start
local c_autumnGreen          = "#76946a"
local c_autumnRed            = "#c34043"
local c_autumnYellow         = "#dca561"
local c_carpYellow           = "#c8ae81"
local c_katanaGray           = "#717c7c"
local c_lotusBlue            = "#9fb5c9"
local c_lotusGray            = "#716e61"
local c_lotusRed0            = "#d7474b"
local c_lotusRed1            = "#e84444"
local c_lotusRed2            = "#d9a594"
local c_macroAqua            = "#95aeac"
local c_macroAsh             = "#626462"
local c_macroBg0             = "#0d0c0c"
local normal_bg              = "#181616"
local c_macroBg2             = "#201d1d"
local c_macroBg3             = "#0d0c0c" -- changed from #282727 to fix box in lualine
local selection_light_gray   = "#393836"
local c_macroBg5             = "#625e5a"
local c_macroBlue0           = "#658594"
local c_macroBlue1           = "#8ba4b0"
local c_macroFg0             = "#c5c9c5"
local c_macroFg1             = "#b4b3a7" -- NOTE: this one
local c_macroFg2             = "#a09f95"
local c_macroGray0           = "#a6a69c"
local c_macroGray1           = "#9e9b93"
local c_macroGray2           = "#7a8382"
local c_macroGreen0          = "#87a987"
local c_macroGreen1          = "#8a9a7b"
local c_macroOrange0         = "#b6927b"
local c_macroOrange1         = "#b98d7b"
local c_macroPink            = "#a292a3"
local c_macroRed             = "#c4746e"
local c_macroTeal            = "#949fb5"
local c_macroViolet          = "#8992a7"
local c_roninYellow          = "#ff9e3b"
local c_springBlue           = "#7fb4ca"
local c_springGreen          = "#98bb6c"
local c_springViolet         = "#938aa9"
local border_purple_ink      = "#54546d"
local c_waveAqua0            = "#6a9589"
local c_waveAqua1            = "#7aa89f"
local c_waveBlue0            = "#223249"
local c_waveBlue1            = "#2d4f67"
local c_waveRed              = "#e46876"
local c_winterBlue           = "#252535"
local c_winterGreen          = "#2e322d"
local c_winterRed            = "#43242b"
local c_winterYellow         = "#322e29"
-- stylua: ignore end
-- }}}

-- Terminal colors {{{
-- stylua: ignore start
vim.g.terminal_color_0  = c_macroBg0
vim.g.terminal_color_1  = c_macroRed
vim.g.terminal_color_2  = c_macroGreen1
vim.g.terminal_color_3  = c_carpYellow
vim.g.terminal_color_4  = c_macroBlue1
vim.g.terminal_color_5  = c_macroPink
vim.g.terminal_color_6  = c_macroAqua
vim.g.terminal_color_7  = c_macroFg0
vim.g.terminal_color_8  = selection_light_gray
vim.g.terminal_color_9  = c_waveRed
vim.g.terminal_color_10 = c_macroGreen0
vim.g.terminal_color_11 = c_autumnYellow
vim.g.terminal_color_12 = c_springBlue
vim.g.terminal_color_13 = c_springViolet
vim.g.terminal_color_14 = c_waveAqua1
vim.g.terminal_color_15 = c_macroFg0
vim.g.terminal_color_16 = c_macroOrange0
vim.g.terminal_color_17 = c_macroOrange1
-- stylua: ignore end
--- }}}

-- Highlight groups {{{1
local hlgroups = {
  -- UI {{{2
  ColorColumn = { bg = c_macroBg2 },
  Conceal = { bold = true, fg = c_macroGray2 },
  CurSearch = { link = "IncSearch" },
  Cursor = { bg = "#89ca78", fg = normal_bg },
  CursorColumn = { link = "CursorLine" },
  CursorIM = { link = "Cursor" },
  CursorLine = { bg = c_macroBg2 },
  CursorLineNr = { fg = c_macroGray0, bold = true },
  DebugPC = { bg = c_winterRed },
  DiffAdd = { bg = c_winterGreen },
  DiffChange = { bg = c_winterBlue },
  DiffDelete = { bg = selection_light_gray },
  DiffText = { bg = border_purple_ink },
  Directory = { fg = c_macroBlue1 },
  EndOfBuffer = { fg = normal_bg },
  ErrorMsg = { fg = c_lotusRed1 },
  FloatBorder = { bg = nil, fg = border_purple_ink },
  CompletionBorder = { bg = nil, fg = border_purple_ink },
  FloatFooter = { bg = c_macroBg0, fg = c_macroBg5 },
  FloatTitle = { bg = c_macroBg0, fg = c_macroGray2, bold = true },
  FoldColumn = { fg = c_macroBg5 },
  Folded = { bg = c_macroBg2, fg = c_lotusGray },
  Ignore = { link = "NonText" },
  IncSearch = { bg = c_carpYellow, fg = c_waveBlue0 },
  LineNr = { fg = c_macroBg5 },
  MatchParen = { bg = selection_light_gray },
  ModeMsg = { fg = c_macroRed, bold = true },
  MoreMsg = { fg = c_macroBlue0 },
  MsgArea = { fg = c_macroFg1 },
  MsgSeparator = { bg = c_macroBg0 },
  NonText = { fg = c_macroBg5 },
  SnippetTabstop = { link = "Snippet" },

  Normal = { fg = c_macroFg0 },
  NormalFloat = { bg = nil, fg = c_macroFg1 },

  -- NormalFloat = { bg = c_macroBg0, fg = c_macroFg1 },
  NormalNC = { link = "Normal" },
  Pmenu = { bg = c_macroBg2, fg = c_macroFg1 },
  PmenuSbar = { bg = "#201d1d" },
  PmenuSel = { bg = selection_light_gray, fg = "NONE" },
  PmenuThumb = { bg = c_macroBg5 },
  Question = { link = "MoreMsg" },
  QuickFixLine = { bg = c_macroBg3 },
  Search = { bg = selection_light_gray },
  SignColumn = { fg = c_macroGray2 },
  SpellBad = { fg = c_lotusRed0, underdashed = true },
  SpellCap = { underdashed = true },
  SpellLocal = { underdashed = true },
  SpellRare = { underdashed = true },
  StatusLine = { bg = nil, fg = c_macroFg0 },
  StatusLineNC = { bg = c_macroBg2, fg = c_macroBg5 },
  Substitute = { bg = c_autumnRed, fg = c_macroFg0 },
  TabLine = { link = "StatusLineNC" },
  TabLineFill = { link = "Normal" },
  TabLineSel = { link = "Visual" },
  TermCursor = { link = "Cursor" },
  TermCursorNC = { fg = normal_bg, bg = c_macroAsh },
  Title = { bold = true, fg = c_macroBlue1 },
  Underlined = { fg = c_macroTeal, underline = true },
  VertSplit = { link = "WinSeparator" },
  Visual = { bg = selection_light_gray },
  VisualNOS = { link = "Visual" },
  WarningMsg = { fg = c_roninYellow },
  Whitespace = { fg = selection_light_gray },
  WildMenu = { link = "Pmenu" },
  WinBar = { bg = c_macroBg2, fg = c_macroFg0 },
  WinBarNC = { bg = c_macroBg2, fg = c_macroFg1 },
  WinSeparator = { fg = selection_light_gray },
  lCursor = { link = "Cursor" },
  -- }}}2

  -- Syntax {{{2
  Boolean = { fg = c_macroOrange0, bold = true },
  Character = { link = "String" },
  Comment = { fg = c_macroAsh },
  Constant = { fg = c_macroOrange0 },
  Delimiter = { fg = c_macroGray1 },
  Error = { fg = c_lotusRed1 },
  Exception = { fg = c_macroRed },
  Float = { link = "Number" },
  Function = { fg = c_macroBlue1 },
  Identifier = { fg = c_macroFg0 },
  Keyword = { fg = c_macroViolet },
  Number = { fg = c_macroPink },
  Operator = { fg = c_macroRed },
  PreProc = { fg = c_macroRed },
  Special = { fg = c_macroTeal },
  SpecialKey = { fg = c_macroGray2 },
  Statement = { fg = c_macroViolet },
  String = { fg = c_macroGreen1 },
  Todo = { fg = c_macroBg0, bg = c_macroBlue0, bold = true },
  Type = { fg = c_macroAqua },
  -- }}}2

  -- Treesitter syntax {{{2
  ["@attribute"] = { link = "Constant" },
  ["@constructor"] = { fg = c_macroTeal },
  ["@constructor.lua"] = { fg = c_macroViolet },
  ["@keyword.exception"] = { bold = true, fg = c_macroRed },
  ["@keyword.import"] = { link = "PreProc" },
  ["@keyword.luap"] = { link = "@string.regexp" },
  ["@keyword.operator"] = { bold = true, fg = c_macroRed },
  ["@keyword.return"] = { fg = c_macroRed, italic = true },
  ["@module"] = { fg = c_macroOrange0 },
  ["@operator"] = { link = "Operator" },
  ["@nospell.latex"] = { fg = "#8ba4b0" },
  ["@markup.math.latex"] = { fg = "#8ba4b0" },
  ["@operator.latex"] = { fg = "#c4746e" },
  -- ["@variable.parameter"] = { fg = c_macroGray0 },
  ["@punctuation.bracket"] = { fg = c_macroGray1 },
  ["@punctuation.delimiter"] = { fg = c_macroGray1 },
  ["@markup.list"] = { fg = c_macroTeal },
  ["@string.escape"] = { fg = c_macroOrange0 },
  ["@string.regexp"] = { fg = c_macroOrange0 },
  ["@string.special.url.comment"] = { fg = c_macroTeal, underline = true },
  ["@markup.link.label.symbol"] = { fg = c_macroFg0 },
  ["@tag.attribute"] = { fg = c_macroFg0 },
  ["@tag.delimiter"] = { fg = c_macroGray1 },
  ["@diff.delta"] = { link = "DiffChanged" },
  ["@diff.minus"] = { link = "DiffRemoved" },
  ["@diff.plus"] = { link = "DiffAdded" },
  ["@markup.emphasis"] = { italic = true },
  ["@markup.environment"] = { link = "Keyword" },
  ["@markup.environment.name"] = { link = "String" },
  ["@markup.raw"] = { link = "String" },
  ["@comment.info"] = { bg = c_waveAqua0, fg = c_waveBlue0, bold = true },
  ["@markup.quote"] = { link = "@variable.parameter" },
  ["@markup.strong"] = { link = "markdownBold" },
  ["@markup.italic.markdown_inline"] = { italic = true },
  ["@markup.heading"] = { link = "Function" },
  ["@markup.heading.1.markdown"] = { fg = c_macroRed },
  ["@markup.heading.2.markdown"] = { fg = c_macroRed },
  ["@markup.heading.3.markdown"] = { fg = c_macroRed },
  ["@markup.heading.4.markdown"] = { fg = c_macroRed },
  ["@markup.heading.5.markdown"] = { fg = c_macroRed },
  ["@markup.heading.6.markdown"] = { fg = c_macroRed },
  ["@markup.heading.1.marker.markdown"] = { link = "Delimiter" },
  ["@markup.heading.2.marker.markdown"] = { link = "Delimiter" },
  ["@markup.heading.3.marker.markdown"] = { link = "Delimiter" },
  ["@markup.heading.4.marker.markdown"] = { link = "Delimiter" },
  ["@markup.heading.5.marker.markdown"] = { link = "Delimiter" },
  ["@markup.heading.6.marker.markdown"] = { link = "Delimiter" },
  -- ["@markup.markdown_inline"] = { fg = c_macroFg0 },
  ["@markup.strikethrough.markdown_inline"] = { strikethrough = true },
  ["@comment.todo.checked"] = { fg = c_macroAsh },
  ["@comment.todo.unchecked"] = { fg = c_macroRed },
  ["@markup.link.label.markdown_inline"] = { link = "htmlLink" },
  ["@markup.link.url.markdown_inline"] = { fg = c_macroAsh, underline = true },
  -- below are overriden by todo-comments
  -- ["@comment.error"] = { bg = c_lotusRed1, fg = c_macroFg0, bold = true },
  -- ["@comment.warning"] = { bg = c_roninYellow, fg = c_waveBlue0, bold = true },
  ["@variable"] = { fg = c_macroFg0 },
  ["@variable.builtin"] = { fg = c_macroRed, italic = true },
  -- }}}

  -- LSP semantic {{{2
  ["@lsp.mod.readonly"] = { link = "Constant" },
  ["@lsp.mod.typeHint"] = { link = "Type" },
  ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
  ["@lsp.type.comment"] = { fg = "NONE" },
  ["@lsp.type.macro"] = { fg = c_macroPink },
  ["@lsp.type.magicFunction"] = { link = "@function.builtin" },
  ["@lsp.type.method"] = { link = "@function.method" },
  ["@lsp.type.namespace"] = { link = "@module" },
  ["@lsp.type.parameter"] = { link = "@variable.parameter" },
  ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
  ["@lsp.type.variable"] = { fg = "NONE" },
  ["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
  ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.function.readonly"] = { bold = true, fg = c_macroBlue1 },
  ["@lsp.typemod.keyword.documentation"] = { link = "Special" },
  ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.operator.controlFlow"] = { link = "@keyword.exception" },
  ["@lsp.typemod.operator.injected"] = { link = "Operator" },
  ["@lsp.typemod.string.injected"] = { link = "String" },
  ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
  ["@lsp.typemod.variable.global"] = { link = "Constant" },
  ["@lsp.typemod.variable.injected"] = { link = "@variable" },
  ["@lsp.typemod.variable.static"] = { link = "Constant" },
  -- }}}

  -- LSP {{{2
  LspCodeLens = { fg = c_macroAsh },
  LspInfoBorder = { link = "FloatBorder" },
  LspReferenceRead = { link = "LspReferenceText" },
  LspReferenceText = { bg = nil },
  LspReferenceWrite = { bg = nil, underline = false },
  LspSignatureActiveParameter = { fg = c_roninYellow },
  -- }}}

  -- Diagnostic {{{2
  DiagnosticError = { fg = c_macroRed },
  DiagnosticHint = { fg = c_macroAqua },
  DiagnosticInfo = { fg = c_macroBlue1 },
  DiagnosticOk = { fg = c_macroGreen1 },
  DiagnosticWarn = { fg = c_carpYellow },
  DiagnosticSignError = { fg = c_macroRed },
  DiagnosticSignHint = { fg = c_macroAqua },
  DiagnosticSignInfo = { fg = c_macroBlue1 },
  DiagnosticSignWarn = { fg = c_carpYellow },
  DiagnosticUnderlineError = { sp = c_macroRed, undercurl = true },
  DiagnosticUnderlineHint = { sp = c_macroAqua, undercurl = true },
  DiagnosticUnderlineInfo = { sp = c_macroBlue1, undercurl = true },
  DiagnosticUnderlineWarn = { sp = c_carpYellow, undercurl = true },
  DiagnosticVirtualTextError = { bg = c_winterRed, fg = c_macroRed },
  DiagnosticVirtualTextHint = { bg = c_winterGreen, fg = c_macroAqua },
  DiagnosticVirtualTextInfo = { bg = c_winterBlue, fg = c_macroBlue1 },
  DiagnosticVirtualTextWarn = { bg = c_winterYellow, fg = c_carpYellow },
  DiagnosticUnnecessary = {
    fg = c_macroAsh,
    sp = c_macroAqua,
    undercurl = true,
  },
  -- }}}

  -- Filetype {{{2
  -- Git
  gitHash = { fg = c_macroAsh },

  -- Sh/Bash
  bashSpecialVariables = { link = "Constant" },
  shAstQuote = { link = "Constant" },
  shCaseEsac = { link = "Operator" },
  shDeref = { link = "Special" },
  shDerefSimple = { link = "shDerefVar" },
  shDerefVar = { link = "Constant" },
  shNoQuote = { link = "shAstQuote" },
  shQuote = { link = "String" },
  shTestOpr = { link = "Operator" },

  -- HTML
  htmlBold = { bold = true },
  htmlBoldItalic = { bold = true, italic = true },
  htmlH1 = { fg = c_macroRed, bold = true },
  htmlH2 = { fg = c_macroRed, bold = true },
  htmlH3 = { fg = c_macroRed, bold = true },
  htmlH4 = { fg = c_macroRed, bold = true },
  htmlH5 = { fg = c_macroRed, bold = true },
  htmlH6 = { fg = c_macroRed, bold = true },
  htmlItalic = { italic = true },
  htmlLink = { fg = c_lotusBlue, underline = true },
  htmlSpecialChar = { link = "SpecialChar" },
  htmlSpecialTagName = { fg = c_macroViolet },
  htmlString = { fg = c_macroAsh },
  htmlTagName = { link = "Tag" },
  htmlTitle = { link = "Title" },

  -- Markdown
  markdownBold = { bold = true, fg = c_carpYellow },
  markdownBoldItalic = { bold = true, italic = true },
  markdownCode = { fg = c_macroGreen1 },
  markdownCodeBlock = { fg = c_macroGreen1 },
  markdownError = { link = "NONE" },
  markdownEscape = { fg = "NONE" },
  markdownH1 = { link = "htmlH1" },
  markdownH2 = { link = "htmlH2" },
  markdownH3 = { link = "htmlH3" },
  markdownH4 = { link = "htmlH4" },
  markdownH5 = { link = "htmlH5" },
  markdownH6 = { link = "htmlH6" },
  markdownListMarker = { fg = c_autumnYellow },

  -- Checkhealth
  healthError = { fg = c_lotusRed0 },
  healthSuccess = { fg = c_springGreen },
  healthWarning = { fg = c_roninYellow },
  helpHeader = { link = "Title" },
  helpSectionDelim = { link = "Title" },

  -- Qf
  qfFileName = { link = "Directory" },
  qfLineNr = { link = "lineNr" },
  -- }}}

  -- Plugins {{{2

  --noice
  NoicePopupmenuSelected = { bg = selection_light_gray },
  NoiceScrollBar = { bg = normal_bg },

  -- gitsigns
  GitSignsAdd = { fg = c_autumnGreen },
  GitSignsChange = { fg = border_purple_ink },
  GitSignsDelete = { fg = c_lotusRed0 },
  GitSignsDeletePreview = { bg = c_winterRed },

  -- diff
  DiffAdded = { fg = c_autumnGreen },
  DiffChanged = { fg = c_autumnYellow },
  DiffDeleted = { fg = c_autumnRed },
  DiffNewFile = { fg = c_autumnGreen },
  DiffOldFile = { fg = c_autumnRed },
  DiffRemoved = { fg = c_autumnRed },

  -- telescope
  TelescopeBorder = { link = "FloatBorder" },
  TelescopeMatching = { fg = c_macroRed, bold = true },
  TelescopeNormal = { link = "NormalFloat" },
  TelescopeResultsClass = { link = "Structure" },
  TelescopeResultsField = { link = "@variable.member" },
  TelescopeResultsMethod = { link = "Function" },
  TelescopeResultsStruct = { link = "Structure" },
  TelescopeResultsVariable = { link = "@variable" },
  TelescopeSelection = { link = "Visual" },
  TelescopeTitle = { fg = c_macroGray2 },
  TelescopePromptBorder = { link = "TelescopeBorder" },

  -- -- nvim-dap-ui (one day I'll use this)
  -- DapUIBreakpointsCurrentLine = { bold = true, fg = c_macroFg0 },
  -- DapUIBreakpointsDisabledLine = { link = "Comment" },
  -- DapUIBreakpointsInfo = { fg = c_macroBlue0 },
  -- DapUIBreakpointsPath = { link = "Directory" },
  -- DapUIDecoration = { fg = border_purple_ink },
  -- DapUIFloatBorder = { fg = border_purple_ink },
  -- DapUILineNumber = { fg = c_macroTeal },
  -- DapUIModifiedValue = { bold = true, fg = c_macroTeal },
  -- DapUIPlayPause = { fg = c_macroGreen1 },
  -- DapUIRestart = { fg = c_macroGreen1 },
  -- DapUIScope = { link = "Special" },
  -- DapUISource = { fg = c_macroRed },
  -- DapUIStepBack = { fg = c_macroTeal },
  -- DapUIStepInto = { fg = c_macroTeal },
  -- DapUIStepOut = { fg = c_macroTeal },
  -- DapUIStepOver = { fg = c_macroTeal },
  -- DapUIStop = { fg = c_lotusRed0 },
  -- DapUIStoppedThread = { fg = c_macroTeal },
  -- DapUIThread = { fg = c_macroFg0 },
  -- DapUIType = { link = "Type" },
  -- DapUIUnavailable = { fg = c_macroAsh },
  -- DapUIWatchesEmpty = { fg = c_lotusRed0 },
  -- DapUIWatchesError = { fg = c_lotusRed0 },
  -- DapUIWatchesValue = { fg = c_macroFg0 },

  -- lazy.nvim
  LazyProgressTodo = { fg = c_macroBg5 },

  -- statusline
  StatusLineGitAdded = { bg = c_macroBg3, fg = c_macroGreen1 },
  StatusLineGitChanged = { bg = c_macroBg3, fg = c_carpYellow },
  StatusLineGitRemoved = { bg = c_macroBg3, fg = c_macroRed },
  StatusLineHeader = { bg = c_macroBg5, fg = c_macroFg1 },
  StatusLineHeaderModified = { bg = c_macroRed, fg = normal_bg },

  -- mini.files
  -- MiniFilesNormal = { bg = nil },
  MiniFilesNormal = { link = "NormalFloat" },
  MiniFilesTitle = { bg = nil, fg = c_macroFg2 },
  MiniFilesDirectory = { fg = c_macroBlue1 },
  MiniFilesTitleFocused = { bg = nil, fg = c_macroFg2 },
  MiniFilesCursorLine = { bg = c_macroBg0 },
  MiniFilesBorder = { link = "FloatBorder" },

  -- incline
  InclineNormal = { bg = "#201D1D", fg = "#afadad" },
  InclineNormalNC = { bg = "#201D1D", fg = "#afadad" },

  -- snacks indent
  SnacksIndent = { fg = selection_light_gray },
  SnacksIndentScope = { fg = border_purple_ink },

  -- neocodeium
  NeoCodeiumSuggestion = { link = "NonText" },
  NeoCodeiumLabel = { fg = c_macroFg0, bg = c_macroBg2 },

  -- treesitter context
  TreesitterContextBottom = { underline = false, bg = c_macroBg2, sp = border_purple_ink },
  TreesitterContextLineNumberBottom = { underline = false, bg = c_macroBg2, sp = border_purple_ink },
  TreesitterContext = { bg = c_macroBg2 },
  TreesitterContextLineNumber = { bg = c_macroBg2, fg = border_purple_ink },

  -- lualine tab pages
  LualineTabInactive = { fg = c_macroAsh },
  LualineTabActive = { fg = c_macroFg0 },

  -- render markdown
  RenderMarkdownCode = { bg = c_macroBg2 },
  RenderMarkdownBullet = { fg = c_macroTeal },
  RenderMarkdownInlineHighlight = { bg = border_purple_ink },

  -- snacks picker
  SnacksPickerListCursorLine = { link = "Visual" },
  SnacksPickerPreviewCursorLine = { link = "CursorLine" },
  -- }}}
}
-- }}}1

-- Set highlight groups {{{1
for hlgroup_name, hlgroup_attr in pairs(hlgroups) do
  vim.api.nvim_set_hl(0, hlgroup_name, hlgroup_attr)
end
-- }}}1

-- !vim:ts=2:sw=2:sts=2:fdm=marker:fdl=0
