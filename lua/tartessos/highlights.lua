local c = require('tartessos.colors')
local cfg = vim.g.tartessos_config
local util = require("tartessos.util")

local M = {}
local hl = {langs = {}, plugins = {}}

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
            group_settings.fg or "none",
            group_settings.bg or "none",
            group_settings.sp or "none",
            group_settings.fmt or "none"))
    end
end

local colors = {
    TextDefault = {fg = c.text_default},
    TextComment = {fg = c.text_comments},
    TextKeyword = {fg = c.keywords},
    TextString = {fg = c.text_string},
    TextChar = {fg = c.text_char},
    TextMath = {fg = c.text_math},
    TextPreproc = {fg = c.text_preprocessor},
    DiffAdd = {fg = c.diff_add},
    DiffDel = {fg = c.diff_delete},
    DiffChange = {fg = c.diff_change},

    LightGrey = {fg = c.light_grey},
    Grey = {fg = c.grey},
    Red = {fg = c.red},
    Cyan = {fg = c.cyan},
    Yellow = {fg = c.yellow},
    Orange = {fg = c.orange},
    Green = {fg = c.green},
    Blue = {fg = c.blue},
    Purple = {fg = c.purple}
}
hl.common = {
    Normal = {fg = c.text_default, bg = cfg.transparent and c.none or c.background},
    Terminal = {fg = c.text_default, bg = cfg.transparent and c.none or c.background},
    EndOfBuffer = {fg = cfg.ending_tildes and c.background or c.background, bg = cfg.transparent and c.none or c.bg0},
    FoldColumn = {fg = c.text_default, bg = cfg.transparent and c.none or c.background},
    Folded = {fg = c.text_default, bg = cfg.transparent and c.none or c.background},
    SignColumn = {fg = c.text_default, bg = cfg.transparent and c.none or c.background},
    ToolbarLine = {fg = c.text_default},
    Cursor = {fmt = "reverse"},
    vCursor = {fmt = "reverse"},
    iCursor = {fmt = "reverse"},
    lCursor = {fmt = "reverse"},
    CursorIM = {fmt = "reverse"},
    CursorColumn = {bg = c.background}, 
    CursorLine = {bg = c.background},
    ColorColumn = {bg = c.background},
    CursorLineNr = {fg = c.editor_line_numbers},
    LineNr = {fg = c.editor_line_numbers},
    Conceal = {fg = c.grey, bg = c.background},
    DiffAdd = {fg = c.none, bg = c.diff_add},
    DiffChange = {fg = c.none, bg = c.diff_change},
    DiffDelete = {fg = c.none, bg = c.diff_delete},
    DiffText = {fg = c.none, bg= c.diff_text},
    DiffAdded = colors.Green,
    DiffRemoved = colors.Red,
    DiffFile = colors.Cyan,
    DiffIndexLine = colors.Grey,
    Directory = {fg = c.blue},
    ErrorMsg = {fg = c.red, fmt = "bold"},
    WarningMsg = {fg = c.yellow, fmt = "bold"},
    MoreMsg = {fg = c.blue, fmt = "bold"},
    CurSearch = {fg = c.background, bg = c.green},
    IncSearch = {fg = c.background, bg = c.green},
    Search = {fg = c.background, bg = c.green},
    Substitute = {fg = c.background, bg = c.green},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.text_default, bg = c.background},
    PmenuSbar = {fg = c.none, bg = c.background},
    PmenuSel = {fg = c.background, bg = c.bg_blue},
    WildMenu = {fg = c.background, bg = c.blue},
    PmenuThumb = {fg = c.none, bg = c.grey},
    Question = {fg = c.yellow},
    SpellBad = {fg = c.none, fmt = "undercurl", sp = c.red},
    SpellCap = {fg = c.none, fmt = "undercurl", sp = c.yellow},
    SpellLocal = {fg = c.none, fmt = "undercurl", sp = c.blue},
    SpellRare = {fg = c.none, fmt = "undercurl", sp = c.purple},
    StatusLine = {fg = c.text_default, bg = c.background},
    StatusLineTerm = {fg = c.text_default, bg = c.background},
    StatusLineNC = {fg = c.grey, bg = c.background},
    StatusLineTermNC = {fg = c.grey, bg = c.background},
    TabLine = {fg = c.text_default, bg = c.background},
    TabLineFill = {fg = c.grey, bg = c.background},
    TabLineSel =  {fg = c.background, bg = c.text_default},
    VertSplit = {fg = c.background},
    Visual = {bg = c.background},
    VisualNOS = {fg = c.none, bg = c.background, fmt = "underline"},
    QuickFixLine = {fg = c.blue, fmt = "underline"},
    Debug = {fg = c.yellow},
    debugPC = {fg = c.background, bg = c.green},
    debugBreakpoint = {fg = c.background, bg = c.red},
    ToolbarButton = {fg = c.background, bg = c.bg_blue},
    FloatBorder = {fg = c.grey, bg = c.background},
    NormalFloat = {fg = c.text_default, bg = c.background},
}

hl.syntax = {
    String = {fg = c.text_string, fmt = cfg.code_style.strings},
    Character = colors.TextChar,
    Number = colors.TextMath,
    Float = colors.TextMath,
    Boolean = colors.TextMath,
    Type = colors.TextKeyword,
    Structure = colors.TextKeyword,
    StorageClass = colors.TextKeyword,
    Identifier = {fg = c.text_default, fmt = cfg.code_style.variables},
    Constant = colors.TextDefault,
    PreProc = colors.TextPreproc,
    PreCondit = colors.TextPreproc,
    Include = colors.TextPreproc,
    Keyword = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
    Define = colors.TextPreproc,
    Typedef = colors.TextPreproc,
    Exception = colors.TextKeyword,
    Conditional = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
    Repeat = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
    Statement = colors.TextKeyword,
    Macro = colors.TextPreproc,
    Error = colors.Purple,
    Label = colors.TextPreproc,
    Special = colors.Red,
    SpecialChar = colors.Red,
    Function = {fg = c.text_keywords, fmt = cfg.code_style.functions},
    Operator = colors.TextMath,
    Title = colors.TextDefault,
    Tag = colors.TextPreproc,
    Delimiter = colors.TextDefault,
    Comment = {fg = c.text_comments, fmt = cfg.code_style.comments},
    SpecialComment = {fg = c.text_comments, fmt = cfg.code_style.comments},
    Todo = {fg = c.yellow, fmt = cfg.code_style.comments}
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    hl.treesitter = {
        ["@annotation"] = colors.TextDefault,
        ["@attribute"] = colors.TextPreproc,
        ["@attribute.typescript"] = colors.TextPreproc,
        ["@boolean"] = colors.TextMath,
        ["@character"] = colors.TextChar,
        ["@comment"] = {fg = c.text_comments, fmt = cfg.code_style.comments},
        ["@conditional"] = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
        ["@constant"] = {fg = c.text_default, fmt = cfg.code_style.constants},
        ["@constant.builtin"] = {fg = c.text_default, fmt = cfg.code_style.constants},
        ["@constant.macro"] = {fg = c.text_preprocessor, fmt = cfg.code_style.constants},
        ["@constructor"] = {fg = c.text_default, fmt = "bold"},
        ["@error"] = colors.TextDefault,
        ["@exception"] = colors.TextKeyword,
        ["@field"] = colors.TextDefault,
        ["@float"] = colors.TextMath,
        ["@function"] = {fg = c.text_keywords, fmt = cfg.code_style.functions},
        ["@function.builtin"] = {fg = c.text_keywords, fmt = cfg.code_style.functions},
        ["@function.macro"] = {fg = c.text_preprocessor, fmt = cfg.code_style.functions},
        ["@include"] = colors.TextPreproc,
        ["@keyword"] = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
        ["@keyword.function"] = {fg = c.text_keywords, fmt = cfg.code_style.functions},
        ["@keyword.operator"] =  {fg = c.text_keywords, fmt = cfg.code_style.keywords},
        ["@label"] = colors.TextPreproc,
        ["@method"] = {fg = c.text_keywords, fmt = cfg.code_style.functions},
        ["@namespace"] = colors.TextPreproc,
        ["@none"] = colors.TextDefault,
        ["@number"] = colors.TextMath,
        ["@operator"] = colors.TextMath,
        ["@parameter"] = colors.TextDefault,
        ["@parameter.reference"] = colors.TextDefault,
        ["@preproc"] = colors.TextPreproc,
        ["@property"] = colors.TextPreproc,
        ["@punctuation.delimiter"] = colors.TextDefault,
        ["@punctuation.bracket"] = colors.TextDefault,
        ["@punctuation.special"] = colors.TextDefault,
        ["@repeat"] = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
        ["@string"] = {fg = c.text_string, fmt = cfg.code_style.strings},
        ["@string.regex"] = {fg = c.text_string, fmt = cfg.code_style.strings},
        ["@string.escape"] = {fg = c.text_string, fmt = cfg.code_style.strings},
        ["@symbol"] = colors.TextPreproc,
        ["@tag"] = colors.TextPreproc,
        ["@tag.attribute"] = colors.TextPreproc,
        ["@tag.delimiter"] = colors.TextPreproc,
        ["@text"] = colors.TextDefault,
        ["@text.strong"] = {fg = c.text_default, fmt = 'bold'},
        ["@text.emphasis"] = {fg = c.text_default, fmt = 'italic'},
        ["@text.underline"] = {fg = c.text_default, fmt = 'underline'},
        ["@text.strike"] = {fg = c.text_default, fmt = 'strikethrough'},
        ["@text.title"] = {fg = c.text_string, fmt = 'bold'},
        ["@text.literal"] = colors.TextString,
        ["@text.uri"] = {fg = c.text_string, fmt = 'underline'},
        ["@text.todo"] = {fg = c.yellow, fmt = cfg.code_style.comments},
        ["@text.math"] = colors.TextMath,
        ["@text.reference"] = colors.TextDefault,
        ["@text.environment"] = colors.TextDefault,
        ["@text.environment.name"] = colors.TextDefault,
        ["@text.diff.add"] = colors.DiffAdd,
        ["@text.diff.delete"] = colors.DiffDel,
        ["@note"] = colors.TextDefault,
        ["@warning"] = colors.TextDefault,
        ["@danger"] = colors.TextDefault,
        ["@type"] = colors.TextKeyword,
        ["@type.builtin"] = colors.TextKeyword,
        ["@variable"] = {fg = c.text_default, fmt = cfg.code_style.variables},
        ["@variable.builtin"] = {fg = c.text_default, fmt = cfg.code_style.variables},
    }

    if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
        hl.lsp = {
            ["@lsp.type.comment"] = hl.treesitter[ "@comment"],
            ["@lsp.type.enum"] = hl.treesitter["@type"],
            ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
            ["@lsp.type.interface"] = hl.treesitter["@type"],
            ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
            ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
            ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
            ["@lsp.type.parameter"] = hl.treesitter["@parameter"],
            ["@lsp.type.property"] = hl.treesitter["@property"],
            ["@lsp.type.variable"] = hl.treesitter["@variable"],
            ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
            ["@lsp.type.method"] = hl.treesitter["@method"],
            ["@lsp.type.number"] = hl.treesitter["@number"],
            ["@lsp.type.generic"] = hl.treesitter["@text"],
            ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
            ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
            ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
            ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
            ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
            ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
            ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
            ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
        }
    end
else
    hl.treesitter = {
        TSAnnotation = colors.TextDefault,
        TSAttribute = colors.TextPreproc,
        TSBoolean = colors.TextMath,
        TSCharacter = colors.TextChar,
        TSComment = {fg = c.text_comments, fmt = cfg.code_style.comments},
        TSConditional = {fg = c.keywords, fmt = cfg.code_style.keywords},
        TSConstant = colors.TextKeyword,
        TSConstBuiltin = colors.TextKeyword,
        TSConstMacro = colors.TextPreproc,
        TSConstructor = {fg = c.text_keywords, fmt = "bold"},
        TSError = colors.TextDefault,
        TSException = colors.TextKeyword,
        TSField = colors.TextDefault,
        TSFloat = colors.TextMath,
        TSFunction = {fg = c.keywords, fmt = cfg.code_style.functions},
        TSFuncBuiltin = {fg = c.keywords, fmt = cfg.code_style.functions},
        TSFuncMacro = {fg = c.text_preprocessor, fmt = cfg.code_style.functions},
        TSInclude = colors.text_preprocessor,
        TSKeyword = {fg = c.keywords, fmt = cfg.code_style.keywords},
        TSKeywordFunction = {fg = c.keywords, fmt = cfg.code_style.functions},
        TSKeywordOperator =  {fg = c.keywords, fmt = cfg.code_style.keywords},
        TSLabel = colors.TextPreproc,
        TSMethod = {fg = c.text_keywords, fmt = cfg.code_style.functions},
        TSNamespace = colors.TextPreproc,
        TSNone = colors.TextDefault,
        TSNumber = colors.TextMath,
        TSOperator = colors.TextMath,
        TSParameter = colors.TextDefault,
        TSParameterReference = colors.TextDefault,
        TSProperty = colors.TextPreproc,
        TSPunctDelimiter = colors.TextDefault,
        TSPunctBracket = colors.TextDefault,
        TSPunctSpecial = colors.TextDefault,
        TSRepeat = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
        TSString = {fg = c.text_string, fmt = cfg.code_style.strings},
        TSStringRegex = {fg = c.text_string, fmt = cfg.code_style.strings},
        TSStringEscape = {fg = c.text_string, fmt = cfg.code_style.strings},
        TSSymbol = colors.TextPreproc,
        TSTag = colors.TextPreproc,
        TSTagDelimiter = colors.TextPreproc,
        TSText = colors.TextDefault,
        TSStrong = {fg = c.text_default, fmt = 'bold'},
        TSEmphasis = {fg = c.text_default, fmt = 'italic'},
        TSUnderline = {fg = c.text_default, fmt = 'underline'},
        TSStrike = {fg = c.text_default, fmt = 'strikethrough'},
        TSTitle = {fg = c.text_default, fmt = 'bold'},
        TSLiteral = colors.TextString,
        TSURI = {fg = c.text_string, fmt = 'underline'},
        TSMath = colors.TextMath,
        TSTextReference = colors.TextDefault,
        TSEnvironment = colors.TextDefault,
        TSEnvironmentName = colors.TextDefault,
        TSNote = colors.TextDefault,
        TSWarning = colors.TextDefault,
        TSDanger = colors.TextDefault,
        TSType = colors.TextKeyword,
        TSTypeBuiltin = colors.TextKeyword,
        TSVariable = {fg = c.text_default, fmt = cfg.code_style.variables},
        TSVariableBuiltin = {fg = c.text_default, fmt = cfg.code_style.variables},
    }
end

local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = colors.Orange,
    LspCxxHlGroupMemberVariable = colors.Orange,
    LspCxxHlGroupNamespace = colors.Blue,
    LspCxxHlSkippedRegion = colors.Grey,
    LspCxxHlSkippedRegionBeginEnd = colors.Red,

    DiagnosticError = {fg = c.red},
    DiagnosticHint = {fg = c.purple},
    DiagnosticInfo = {fg = c.cyan},
    DiagnosticWarn = {fg = c.yellow},

    DiagnosticVirtualTextError = { bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.background) or c.none,
                                   fg = diagnostics_error_color },
    DiagnosticVirtualTextWarn = { bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.background) or c.none,
                                  fg = diagnostics_warn_color },
    DiagnosticVirtualTextInfo = { bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.background) or c.none,
                                  fg = diagnostics_info_color },
    DiagnosticVirtualTextHint = { bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.background) or c.none,
                                  fg = diagnostics_hint_color },

    DiagnosticUnderlineError = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red},
    DiagnosticUnderlineHint = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple},
    DiagnosticUnderlineInfo = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue},
    DiagnosticUnderlineWarn = {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow},

    LspReferenceText = { bg = c.background },
    LspReferenceWrite = { bg = c.background },
    LspReferenceRead = { bg = c.background },

    LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
    LspCodeLensSeparator = { fg = c.grey },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.ale = {
    ALEErrorSign = hl.plugins.lsp.DiagnosticError,
    ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
    ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
    BufferCurrent = { fmt = "bold" },
    BufferCurrentMod = { fg = c.orange, fmt = "bold,italic" },
    BufferCurrentSign = { fg = c.purple },
    BufferInactiveMod = { fg = c.light_grey, bg = c.background, fmt = "italic" },
    BufferVisible = { fg = c.light_grey, bg = c.background },
    BufferVisibleMod = { fg = c.yellow, bg = c.background, fmt = "italic" },
    BufferVisibleIndex = { fg = c.light_grey, bg = c.background },
    BufferVisibleSign = { fg = c.light_grey, bg = c.background },
    BufferVisibleTarget = { fg = c.light_grey, bg = c.background },
}

hl.plugins.cmp = {
    CmpItemAbbr = colors.TextDefault,
    CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
    CmpItemAbbrMatch = colors.Cyan,
    CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
    CmpItemMenu = colors.LightGrey,
    CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
    CocErrorSign = hl.plugins.lsp.DiagnosticError,
    CocHintSign = hl.plugins.lsp.DiagnosticHint,
    CocInfoSign = hl.plugins.lsp.DiagnosticInfo,
    CocWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
    WhichKey = colors.Red,
    WhichKeyDesc = colors.Blue,
    WhichKeyGroup = colors.Orange,
    WhichKeySeparator = colors.Green
}

hl.plugins.gitgutter = {
    GitGutterAdd = {fg = c.diff_add},
    GitGutterChange = {fg = c.diff_change},
    GitGutterDelete = {fg = c.diff_delete},
}

hl.plugins.hop = {
    HopNextKey = {fg = c.red, fmt = "bold"},
    HopNextKey1 = {fg = c.cyan, fmt = "bold"},
    HopNextKey2 = {fg = util.darken(c.blue, 0.7)},
    HopUnmatched = colors.Grey,
}

-- comment
hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.text_preprocessor, fmt = "bold"},
    DiffviewFilePanelCounter = {fg = c.text_default, fmt = "bold"},
    DiffviewFilePanelFileName = colors.TextDefault,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = colors.Grey,
    DiffviewFilePanelPath = colors.Grey,
    DiffviewFilePanelInsertions = colors.Green,
    DiffviewFilePanelDeletions = colors.Red,
    DiffviewStatusAdded = colors.Green,
    DiffviewStatusUntracked = colors.DiffChange,
    DiffviewStatusModified = colors.DiffChange,
    DiffviewStatusRenamed = colors.DiffChange,
    DiffviewStatusCopied = colors.DiffChange,
    DiffviewStatusTypeChange = colors.DiffChange,
    DiffviewStatusUnmerged = colors.DiffChange,
    DiffviewStatusUnknown = colors.DiffDel,
    DiffviewStatusDeleted = colors.DiffDel,
    DiffviewStatusBroken = colors.DiffDel
}

hl.plugins.gitsigns = {
    GitSignsAdd = colors.DiffAdd,
    GitSignsAddLn = colors.DiffAdd,
    GitSignsAddNr = colors.DiffAdd,
    GitSignsChange = colors.DiffChange,
    GitSignsChangeLn = colors.DiffChange,
    GitSignsChangeNr = colors.DiffChange,
    GitSignsDelete = colors.DiffDel,
    GitSignsDeleteLn = colors.DiffDel,
    GitSignsDeleteNr = colors.DiffDel
}

hl.plugins.neo_tree = {
    NeoTreeNormal = { fg = c.text_default, bg = cfg.transparent and c.none or c.background },
    NeoTreeNormalNC = { fg = c.text_default, bg = cfg.transparent and c.none or c.background },
    NeoTreeVertSplit = { fg = c.background, bg = cfg.transparent and c.none or c.background },
    NeoTreeWinSeparator = { fg = c.background, bg = cfg.transparent and c.none or c.background },
    NeoTreeEndOfBuffer = { fg = cfg.ending_tildes and c.background or c.background, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeRootName = { fg = c.orange, fmt = "bold" },
    NeoTreeGitAdded = colors.Green,
    NeoTreeGitDeleted = colors.Red,
    NeoTreeGitModified = colors.Yellow,
    NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
    NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
    NeoTreeIndentMarker = colors.Grey,
    NeoTreeSymbolicLinkTarget = colors.Purple,
}

hl.plugins.neotest = {
    NeotestAdapterName = { fg = c.purple, fmt = "bold" },
    NeotestDir = colors.Cyan,
    NeotestExpandMarker = colors.Grey,
    NeotestFailed = colors.Red,
    NeotestFile = colors.Cyan,
    NeotestFocused = { fmt = "bold,italic" },
    NeotestIndent = colors.Grey,
    NeotestMarked = { fg = c.orange, fmt = "bold" },
    NeotestNamespace = colors.Blue,
    NeotestPassed = colors.Green,
    NeotestRunning = colors.Yellow,
    NeotestWinSelect = { fg = c.cyan, fmt = "bold" },
    NeotestSkipped = colors.LightGrey,
    NeotestTarget = colors.Purple,
    NeotestTest = colors.TextDefault,
    NeotestUnknown = colors.LightGrey,
}

hl.plugins.nvim_tree = {
    NvimTreeNormal = { fg = c.text_default, bg = cfg.transparent and c.none or c.background },
    NvimTreeVertSplit = { fg = c.background, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeEndOfBuffer = { fg = cfg.ending_tildes and c.background or c.background, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
    NvimTreeGitDirty = colors.Yellow,
    NvimTreeGitNew = colors.Green,
    NvimTreeGitDeleted = colors.Red,
    NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
    NvimTreeIndentMarker = colors.TextDefault,
    NvimTreeImageFile = { fg = c.dark_purple },
    NvimTreeSymlink = colors.Purple,
    NvimTreeFolderName = colors.Blue,
}
hl.plugins.telescope = {
    TelescopeBorder = colors.Red,
    TelescopePromptBorder = colors.Cyan,
    TelescopeResultsBorder = colors.Cyan,
    TelescopePreviewBorder = colors.Cyan,
    TelescopeMatching = { fg = c.orange, fmt = "bold" },
    TelescopePromptPrefix = colors.Green,
    TelescopeSelection =  { bg = c.background },
    TelescopeSelectionCaret = colors.Yellow
}

hl.plugins.dashboard = {
    DashboardShortCut = colors.Blue,
    DashboardHeader = colors.Yellow,
    DashboardCenter = colors.Cyan,
    DashboardFooter = { fg = c.dark_red, fmt = "italic"}
}

hl.plugins.outline = {
    FocusedSymbol = { fg = c.purple, bg = c.background, fmt = "bold" },
    AerialLine = { fg = c.purple, bg = c.background, fmt = "bold" },
}

hl.plugins.navic = {
    NavicText = { fg = c.text_default },
    NavicSeparator = { fg = c.light_grey },
}

hl.plugins.ts_rainbow = {
    rainbowcol1 = colors.LightGrey,
    rainbowcol2 = colors.Yellow,
    rainbowcol3 = colors.Blue,
    rainbowcol4 = colors.Orange,
    rainbowcol5 = colors.Purple,
    rainbowcol6 = colors.Green,
    rainbowcol7 = colors.Red
}

hl.plugins.ts_rainbow2 = {
    TSRainbowRed = colors.Red,
    TSRainbowYellow = colors.Yellow,
    TSRainbowBlue = colors.Blue,
    TSRainbowOrange = colors.Orange,
    TSRainbowGreen = colors.Green,
    TSRainbowViolet = colors.Purple,
    TSRainbowCyan = colors.Cyan,
}

hl.plugins.rainbow_delimiters = {
    RainbowDelimiterRed = colors.Red,
    RainbowDelimiterYellow = colors.Yellow,
    RainbowDelimiterBlue = colors.Blue,
    RainbowDelimiterOrange = colors.Orange,
    RainbowDelimiterGreen = colors.Green,
    RainbowDelimiterViolet = colors.Purple,
    RainbowDelimiterCyan = colors.Cyan,
}

hl.plugins.indent_blankline = {
    IndentBlanklineIndent1 = colors.Blue,
    IndentBlanklineIndent2 = colors.Green,
    IndentBlanklineIndent3 = colors.Cyan,
    IndentBlanklineIndent4 = colors.LightGrey,
    IndentBlanklineIndent5 = colors.Purple,
    IndentBlanklineIndent6 = colors.Red,
    IndentBlanklineChar = { fg = c.background, fmt = "nocombine" },
    IndentBlanklineContextChar = { fg = c.grey, fmt = "nocombine" },
    IndentBlanklineContextStart = { sp = c.grey, fmt = "underline" },
    IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

    -- Ibl v3
    IblIndent = { fg = c.background, fmt = "nocombine" },
    IblWhitespace = { fmt = "nocombine" },
    IblScope = { fmt = "nocombine" },
}

hl.plugins.mini = {
    MiniCompletionActiveParameter = { fmt = "underline" },

    MiniCursorword = { fmt = "underline" },
    MiniCursorwordCurrent = { fmt = "underline" },

    MiniIndentscopeSymbol = { fg = c.grey },
    MiniIndentscopePrefix = { fmt = "nocombine" }, -- Make it invisible

    MiniJump = { fg = c.purple, fmt = "underline", sp = c.purple },

    MiniJump2dSpot = { fg = c.red, fmt = "bold,nocombine" },

    MiniStarterCurrent = { fmt = "nocombine" },
    MiniStarterFooter = { fg = c.dark_red, fmt = "italic" },
    MiniStarterHeader = colors.Yellow,
    MiniStarterInactive = { fg = c.grey, fmt = cfg.code_style.comments },
    MiniStarterItem = { fg = c.text_default, bg = cfg.transparent and c.none or c.background },
    MiniStarterItemBullet = { fg = c.grey },
    MiniStarterItemPrefix = { fg = c.yellow },
    MiniStarterSection = colors.LightGrey,
    MiniStarterQuery = { fg = c.cyan },

    MiniStatuslineDevinfo = { fg = c.text_default, bg = c.background },
    MiniStatuslineFileinfo = { fg = c.text_default, bg = c.background },
    MiniStatuslineFilename = { fg = c.grey, bg = c.background },
    MiniStatuslineInactive = { fg = c.grey, bg = c.background },
    MiniStatuslineModeCommand = { fg = c.background, bg = c.yellow, fmt = "bold" },
    MiniStatuslineModeInsert = { fg = c.background, bg = c.blue, fmt = "bold" },
    MiniStatuslineModeNormal = { fg = c.background, bg = c.green, fmt = "bold" },
    MiniStatuslineModeOther = { fg = c.background, bg = c.cyan, fmt = "bold" },
    MiniStatuslineModeReplace = { fg = c.background, bg = c.red, fmt = "bold" },
    MiniStatuslineModeVisual = { fg = c.background, bg = c.purple, fmt = "bold" },

    MiniSurround = { fg = c.background, bg = c.orange },

    MiniTablineCurrent = { fmt = "bold" },
    MiniTablineFill = { fg = c.grey, bg = c.background },
    MiniTablineHidden = { fg = c.text_default, bg = c.background },
    MiniTablineModifiedCurrent = { fg = c.orange, fmt = "bold,italic" },
    MiniTablineModifiedHidden = { fg = c.light_grey, bg = c.background, fmt = "italic" },
    MiniTablineModifiedVisible = { fg = c.yellow, bg = c.background, fmt = "italic" },
    MiniTablineTabpagesection = { fg = c.background, bg = c.bg_yellow },
    MiniTablineVisible = { fg = c.light_grey, bg = c.background },

    MiniTestEmphasis = { fmt = "bold" },
    MiniTestFail = { fg = c.red, fmt = "bold" },
    MiniTestPass = { fg = c.green, fmt = "bold" },

    MiniTrailspace = { bg = c.red },
}

hl.langs.c = {
    cInclude = colors.TextPreproc,
    cStorageClass = colors.TextKeyword,
    cTypedef = colors.TextPreproc,
    cDefine = colors.TextPreproc,
    cTSInclude = colors.TextPreproc,
    cTSConstant = colors.TextKeyword,
    cTSConstMacro = colors.TextPreproc,
    cTSOperator = colors.TextMath,
}

hl.langs.cpp = {
    cppStatement = { fg = c.keywords, fmt = "bold" },
    cppTSInclude = colors.TextPreproc,
    cppTSConstant = colors.TextKeyword,
    cppTSConstMacro = colors.TextPreproc,
    cppTSOperator = colors.TextMath,
}

hl.langs.markdown = {
    markdownBlockquote = colors.TextDefault,
    markdownBold = {fg = c.none, fmt = "bold"},
    markdownBoldDelimiter = colors.TextDefault,
    markdownCode = colors.TextString,
    markdownCodeBlock = colors.TextString,
    markdownCodeDelimiter = colors.TextString,
    markdownH1 = {fg = c.red, fmt = "bold"},
    markdownH2 = {fg = c.purple, fmt = "bold"},
    markdownH3 = {fg = c.orange, fmt = "bold"},
    markdownH4 = {fg = c.red, fmt = "bold"},
    markdownH5 = {fg = c.purple, fmt = "bold"},
    markdownH6 = {fg = c.orange, fmt = "bold"},
    markdownHeadingDelimiter = colors.TextDefault,
    markdownHeadingRule = colors.TextDefault,
    markdownId = colors.Yellow,
    markdownIdDeclaration = colors.Red,
    markdownItalic = {fg = c.none, fmt = "italic"},
    markdownItalicDelimiter = {fg = c.text_default, fmt = "italic"},
    markdownLinkDelimiter = colors.TextDefault,
    markdownLinkText = colors.TextDefault,
    markdownLinkTextDelimiter = colors.TextDefault,
    markdownListMarker = colors.TextDefault,
    markdownOrderedListMarker = colors.TextDefault,
    markdownRule = colors.TextDefault,
    markdownUrl = {fg = c.text_comments, fmt = "underline"},
    markdownUrlDelimiter = colors.TextDefault,
    markdownUrlTitleDelimiter = colors.TextDefault
}

hl.langs.php = {
    phpFunctions = {fg = c.text_default, fmt = cfg.code_style.functions},
    phpMethods = colors.TextKeyword,
    phpStructure = colors.TextKeyword,
    phpOperator = colors.TextMath,
    phpMemberSelector = colors.TextDefault,
    phpVarSelector = {fg = c.text_keywords, fmt = cfg.code_style.variables},
    phpIdentifier = {fg = c.text_keywords, fmt = cfg.code_style.variables},
    phpBoolean = colors.TextMath,
    phpNumber = colors.TextMath,
    phpHereDoc = colors.TextComment,
    phpNowDoc = colors.TextComment,
    phpSCKeyword = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
    phpFCKeyword = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
    phpRegion = colors.TextPreproc
}

hl.langs.scala = {
    scalaNameDefinition = colors.TextDefault,
    scalaInterpolationBoundary = colors.TextPreproc,
    scalaInterpolation = colors.TextKeyword,
    scalaTypeOperator = colors.TextMath,
    scalaOperator = colors.TextMath,
    scalaKeywordModifier = {fg = c.text_keywords, fmt = cfg.code_style.keywords},
}

hl.langs.tex = {
    latexTSInclude = colors.TextPreproc,
    latexTSFuncMacro = {fg = c.text_default, fmt = cfg.code_style.functions},
    latexTSEnvironment = { fg = c.text_math, fmt = "bold" },
    latexTSEnvironmentName = colors.TextKeyword,
    texCmdEnv = colors.TextPreproc,
    texEnvArgName = colors.TextKeyword,
    latexTSTitle = colors.TextKeyword,
    latexTSType = colors.TextKeyword,
    latexTSMath   = colors.TextMath,
    texMathZoneX  = colors.TextMath,
    texMathZoneXX = colors.TextMath,
    texMathDelimZone = colors.TextDefault,
    texMathDelim = colors.TextDefault,
    texMathOper = colors.TextMath,
    texCmd = colors.TextPreproc,
    texCmdPart = colors.TextDefault,
    texCmdPackage = colors.TextDefault,
    texPgfType = colors.TextComment,
}

hl.langs.vim = {
    vimOption = colors.TextKeyword,
    vimSetEqual = colors.TextDefault,
    vimMap = colors.TextKeyword,
    vimMapModKey = colors.TextDefault,
    vimNotation = colors.TextPreproc,
    vimMapLhs = colors.TextDefault,
    vimMapRhs = colors.TextPreproc,
    vimVar = {fg = c.text_default, fmt = cfg.code_style.variables},
    vimCommentTitle = {fg = c.text_comments, fmt = cfg.code_style.comments},
}

local lsp_kind_icons_color = {
    Default = c.text_default,
    Array = c.text_math,
    Boolean = c.text_math,
    Class = c.text_keywords,
    Color = c.text_comments,
    Constant = c.text_default,
    Constructor = c.text_keywords,
    Enum = c.text_keywords,
    EnumMember = c.text_default,
    Event = c.text_default,
    Field = c.text_default,
    File = c.text_default,
    Folder = c.text_keywords,
    Function = c.text_keywords,
    Interface = c.text_keywords,
    Key = c.text_keywords,
    Keyword = c.text_keywords,
    Method = c.text_keywords,
    Module = c.text_preprocessor,
    Namespace = c.text_preprocessor,
    Null = c.text_math,
    Number = c.text_math,
    Object = c.text_keywords,
    Operator = c.text_math,
    Package = c.text_preprocessor,
    Property = c.text_preprocessor,
    Reference = c.text_default,
    Snippet = c.text_default,
    String = c.text_string,
    Struct = c.text_keywords,
    Text = c.text_default,
    TypeParameter = c.text_default,
    Unit = c.text_default,
    Value = c.text_default,
    Variable = c.text_keywords,
}

function M.setup()
    -- define cmp and aerial kind highlights with lsp_kind_icons_color
    for kind, color in pairs(lsp_kind_icons_color) do
        hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
        hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
        hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
    end

    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    if hl.lsp then
        vim_highlights(hl.lsp)
    end
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end

    -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then return "" end
        if color_name:sub(1, 1) == '$' then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify('tartessos.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "onedark.nvim" })
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.tartessos_config.highlights) do
        vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
            replace_color("guifg", group_settings.fg),
            replace_color("guibg", group_settings.bg),
            replace_color("guisp", group_settings.sp),
            replace_color("gui", group_settings.fmt)))
    end
end

return M
