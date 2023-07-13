local palette = {
        base00 = "#1e1e29", -- Default Background
        base01 = "#2d2d3e", -- Lighter Background (Used for status bars, line number and folding marks)
        base02 = "#3d3d52", -- Selection Background
        base03 = "#8a8aa8", -- Comments, Invisibles, Line Highlighting
        base04 = "#adadc2", -- Dark Foreground (Used for status bars)
        base05 = "#d1d1dd", -- Default Foreground, Caret, Delimiters, Operators
        base06 = "#e2e2e9", -- Light Foreground (Not often used)
        base07 = "#f4f4f7", -- Light Background (Not often used)
        base08 = "#afaffd", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        base09 = "#afd6fd", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
        base0A = "#b8b8f4", -- Classes, Markup Bold, Search Text Background
        base0B = "#d6affd", -- Strings, Inherited Class, Markup Code, Diff Inserted
        base0C = "#d6affd", -- Support, Regular Expressions, Escape Characters, Markup Quotes
        base0D = "#b8d6f4", -- Functions, Methods, Attribute IDs, Headings
        base0E = "#afaffd", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
        base0F = "#b8b8f4", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

        error = "#fda1a1",
        warn = "#ffcf9d",
        info = "#aed7ff",
}

local function hl(name, table)
        vim.api.nvim_set_hl(0, name, table)
end

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
hl("ErrorMsg", { fg = palette.error, bg = palette.base00 })
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
hl("MsgArea", { fg = palette.base05, bg = palette.base00 })
hl("MsgSeparator", { fg = palette.base04, bg = palette.base02 })
hl("NonText", { fg = palette.base03 })
hl("Normal", { fg = palette.base05, bg = palette.base00 })
hl("NormalFloat", { fg = palette.base05, bg = palette.base00 })
hl("FloatBorder", { link = "WinSeparator" })
hl("NormalNC", { fg = palette.base05, bg = palette.base00 })
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
hl("WarningMsg", { fg = palette.warn })
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

hl("Error", { fg = palette.base00, bg = palette.error })
hl("Todo", { fg = palette.base0A, bg = palette.base01 })

hl("DiagnosticError", { fg = palette.error })
hl("DiagnosticInfo", { fg = palette.info })
hl("DiagnosticWarn", { fg = palette.warn })
hl("DiagnosticFloatingError", { fg = palette.error, bg = palette.base01 })
hl("DiagnosticFloatingInfo", { fg = palette.info, bg = palette.base01 })
hl("DiagnosticFloatingWarn", { fg = palette.warn, bg = palette.base01 })
hl("DiagnosticSignError", { link = "DiagnosticFloatingError" })
hl("DiagnosticSignInfo", { link = "DiagnosticFloatingInfo" })
hl("DiagnosticSignWarn", { link = "DiagnosticFloatingWarn" })
hl("DiagnosticUnderlineError", { underline = true, sp = palette.error })
hl("DiagnosticUnderlineInfo", { underline = true, sp = palette.info })
hl("DiagnosticUnderlineWarn", { underline = true, sp = palette.warn })

hl("@lsp.type.namespace", { link = "Identifier" })
hl("@lsp.mod.readonly", { link = "Constant" })

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
