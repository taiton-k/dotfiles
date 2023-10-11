local palette = {
        base00 = "#181e32", -- Default Background
        base01 = "#2b3248", -- Lighter Background (Used for status bars, line number and folding marks)
        base02 = "#3f475e", -- Selection Background
        base03 = "#7f88a2", -- Comments, Invisibles, Line Highlighting
        base04 = "#9ba4be", -- Dark Foreground (Used for status bars)
        base05 = "#b7c0dc", -- Default Foreground, Caret, Delimiters, Operators
        base06 = "#d3ddf9", -- Light Foreground (Not often used)
        base07 = "#ffffff", -- Light Background (Not often used)
        base08 = "#87a0f0", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        base09 = "#56dac4", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
        base0A = "#b7c0dc", -- Classes, Markup Bold, Search Text Background
        base0B = "#bac98e", -- Strings, Inherited Class, Markup Code, Diff Inserted
        base0C = "#bac98e", -- Support, Regular Expressions, Escape Characters, Markup Quotes
        base0D = "#b093e5", -- Functions, Methods, Attribute IDs, Headings
        base0E = "#d5bf85", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
        base0F = "#9ba4be", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

        red = "#f0aea2",
        orange = "#e8b58d",
        yellow = "#d5bf85",
        green = "#9cd0a6",
        teal = "#85d2c3",
        skyblue = "#81cfdd",
        blue = "#adbff6",
}

local transparent = true
if transparent then
        palette.bg = nil
else
        palette.bg = palette.base00
end

local function hl(name, table)
        vim.api.nvim_set_hl(0, name, table)
end

hl("IndentBlankLine", { fg = palette.base03 })
hl("IndentBlankLineScope", { fg = palette.red })

hl("ColorColumn", { bg = palette.base01 })
hl("Conceal", { fg = palette.base0D })
hl("CurSearch", { fg = palette.base01, bg = palette.base09 })
hl("Cursor", { fg = palette.base00, bg = palette.base05 })
hl("CursorColumn", { bg = palette.base01 })
hl("CursorIM", { fg = palette.base00, bg = palette.base05 })
hl("CursorLine", { bg = palette.base01 })
hl("CursorLineFold", { fg = palette.base0C, bg = palette.base01 })
hl("CursorLineNr", { fg = palette.base04, bg = palette.base01 })
hl("CursorLineSign", { fg = palette.base03, bg = palette.base01 })
hl("DiffAdd", { fg = palette.base0B, bg = palette.base01 })
hl("DiffChange", { fg = palette.base0E, bg = palette.base01 })
hl("DiffDelete", { fg = palette.base08, bg = palette.base01 })
hl("DiffText", { fg = palette.base0D, bg = palette.base01 })
hl("Directory", { fg = palette.base0D })
hl("EndOfBuffer", { fg = palette.base03 })
hl("ErrorMsg", { fg = palette.red, bg = palette.bg })
hl("FoldColumn", { fg = palette.base0C, bg = palette.base01 })
hl("Folded", { fg = palette.base03, bg = palette.base01 })
hl("IncSearch", { fg = palette.base01, bg = palette.base09 })
hl("lCursor", { fg = palette.base00, bg = palette.base05 })
hl("LineNr", { fg = palette.base03, bg = palette.base01 })
hl("LineNrAbove", { fg = palette.base03, bg = palette.base01 })
hl("LineNrBelow", { fg = palette.base03, bg = palette.base01 })

hl("MatchParen", { bg = palette.base02 })
hl("ModeMsg", { fg = palette.base0B })
hl("MoreMsg", { fg = palette.base0B })
hl("MsgArea", { fg = palette.base05, bg = palette.bg })
hl("MsgSeparator", { fg = palette.base04, bg = palette.base02 })
hl("NonText", { fg = palette.base03 })
hl("Normal", { fg = palette.base05, bg = palette.bg })
hl("NormalFloat", { fg = palette.base05, bg = palette.base00 })
hl("FloatBorder", { fg = palette.base02, bg = palette.bg })
hl("NormalNC", { fg = palette.base05, bg = palette.bg })
hl("PMenu", { fg = palette.base05, bg = palette.base01 })
hl("PMenuSbar", { bg = palette.base02 })
hl("PMenuSel", { fg = palette.base01, bg = palette.base05 })
hl("PMenuThumb", { bg = palette.base07 })
hl("Question", { fg = palette.base0D })
hl("QuickFixLine", { bg = palette.base01 })
hl("Search", { fg = palette.base01, bg = palette.base0A })
hl("SignColumn", { fg = palette.base03, bg = palette.base01 })
hl("SpecialKey", { fg = palette.base03 })
hl("SpellBad", { bg = nil, undercurl = true, sp = palette.base08 })
hl("SpellCap", { bg = nil, undercurl = true, sp = palette.base0D })
hl("SpellLocal", { bg = nil, undercurl = true, sp = palette.base0C })
hl("SpellRare", { bg = nil, undercurl = true, sp = palette.base0E })
hl("StatusLine", { fg = palette.base02 })
hl("StatusLineNC", { fg = palette.base02, sp = "#000000" })
hl("Substitute", { fg = palette.base01, bg = palette.base0A })
hl("TabLine", { fg = palette.base03, bg = palette.base01 })
hl("TabLineFill", { fg = palette.base03, bg = palette.base01 })
hl("TabLineSel", { fg = palette.base0B, bg = palette.base01 })
hl("TermCursor", { bg = nil, reverse = true })
hl("TermCursorNC", { bg = nil, reverse = true })
hl("Title", { fg = palette.base0D })
hl("Visual", { bg = palette.base02 })
hl("VisualNOS", { fg = palette.base08 })
hl("WarningMsg", { fg = palette.orange })
hl("Whitespace", { fg = palette.base03 })
hl("WildMenu", { fg = palette.base08, bg = palette.base0A })
hl("WinBar", { fg = palette.base04, bg = palette.base02 })
hl("WinBarNC", { fg = palette.base03, bg = palette.base01 })
hl("WinSeparator", { fg = palette.base02 })



hl("Comment", { fg = palette.base03 })

hl("Constant", { fg = palette.base09, bold = true })
hl("String", { fg = palette.base0B })
hl("Character", { link = "String" })
hl("Number", { fg = palette.base09 })
hl("Boolean", { fg = palette.base09 })
hl("Float", { fg = palette.base09 })

hl("Identifier", { fg = palette.base08 })
hl("Function", { fg = palette.base0D, italic = true })

hl("Statement", { fg = palette.base0E, italic = true })
hl("Conditional", { link = "Statement" })
hl("Repeat", { link = "Statement" })
hl("Label", { fg = palette.base0A, bold = true })
hl("Operator", { fg = palette.base05 })
hl("Keyword", { link = "Statement" })
hl("Exception", { link = "Statement" })

hl("PreProc", { fg = palette.base0A })
hl("Include", { link = "PreProc" })
hl("Define", { link = "PreProc" })
hl("Macro", { link = "Constant" })
hl("PreCondit", { link = "PreProc" })

hl("Type", { fg = palette.base0A, bold = true })
hl("StorageClass", { link = "Type" })
hl("Structure", { link = "Type" })
hl("Typedef", { link = "Type" })

hl("Special", { link = "Constant" })
hl("SpecialChar", { fg = palette.base0C, bold = true, italic = true })
hl("Tag", { fg = palette.base0A })
hl("Delimiter", { fg = palette.base0F })
hl("SpecialComment", { fg = palette.base05, bold = true })
hl("Debug", { fg = palette.base08 })

hl("Underlined", { underline = true })
hl("Bold", { bold = true })
hl("Italic", { italic = true })

hl("Ignore", { fg = palette.base0C })

hl("Error", { fg = palette.base00, bg = palette.red })
hl("Todo", { fg = palette.base0A, bg = palette.base01 })

hl("DiagnosticError", { fg = palette.red })
hl("DiagnosticWarn", { fg = palette.orange })
hl("DiagnosticInfo", { fg = palette.teal })
hl("DiagnosticHint", { fg = palette.skyblue })
hl("DiagnositcOk", { fg = palette.green })
hl("DiagnosticUnderlineError", { underline = true, sp = palette.red })
hl("DiagnosticUnderlineWarn", { underline = true, sp = palette.orange })
hl("DiagnosticUnderlineInfo", { underline = true, sp = palette.teal })
hl("DiagnosticUnderlineHint", { underline = true, sp = palette.skyblue })
hl("DiagnosticUnderlineOk", { underline = true, sp = palette.green })
hl("DiagnosticFloatingError", { link = "DiagnosticError" })
hl("DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
hl("DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
hl("DiagnosticFloatingHint", { link = "DiagnosticHint" })
hl("DiagnositcFloatingOk", { link = "DiagnosticOk" })
hl("DiagnosticSignError", { link = "DiagnosticError" })
hl("DiagnosticSignWarn", { link = "DiagnosticWarn" })
hl("DiagnosticSignInfo", { link = "DiagnosticInfo" })
hl("DiagnosticSignHint", { link = "DiagnosticHint" })
hl("DiagnositcSignOk", { link = "DiagnosticError" })


hl("@lsp.type.namespace", { link = "Identifier" })
hl("@lsp.mod.readonly", { link = "Constant" })

--[[
vim.g.terminal_color_0 = palette.base00
vim.g.terminal_color_1 = palette.base08
vim.g.terminal_color_2 = palette.base0B
vim.g.terminal_color_3 = palette.base0A
vim.g.terminal_color_4 = palette.base0D
vim.g.terminal_color_5 = palette.base0E
vim.g.terminal_color_6 = palette.base0C
vim.g.terminal_color_7 = palette.base05
vim.g.terminal_color_8 = palette.base03
vim.g.terminal_color_9 = palette.base08
vim.g.terminal_color_10 = palette.base0B
vim.g.terminal_color_11 = palette.base0A
vim.g.terminal_color_12 = palette.base0D
vim.g.terminal_color_13 = palette.base0E
vim.g.terminal_color_14 = palette.base0C
vim.g.terminal_color_15 = palette.base07
]]
--
