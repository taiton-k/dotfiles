local palette = {
        base00 = "#21212c", -- Default Background
        base01 = "#414158", -- Lighter Background (Used for status bars, line number and folding marks)
        base02 = "#626284", -- Selection Background
        base03 = "#8a8aa8", -- Comments, Invisibles, Line Highlighting
        base04 = "#b6b6c9", -- Dark Foreground (Used for status bars)
        base05 = "#e2e2ea", -- Default Foreground, Caret, Delimiters, Operators
        base06 = "#eeeef2", -- Light Foreground (Not often used)
        base07 = "#fafafb", -- Light Background (Not often used)
        base08 = "#aeaeff", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        base09 = "#aed7ff", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
        base0A = "#aeaeff", -- Classes, Markup Bold, Search Text Background
        base0B = "#d7adff", -- Strings, Inherited Class, Markup Code, Diff Inserted
        base0C = "#aeaeff", -- Support, Regular Expressions, Escape Characters, Markup Quotes
        base0D = "#aec3ff", -- Functions, Methods, Attribute IDs, Headings
        base0E = "#b6b7f7", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
        base0F = "#aeaeff", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

        error = "#ff7171",
        warn = "#ffb971",
        info = "#aed7ff"
}

local function hl(name, table)
        vim.api.nvim_set_hl(0, name, table)
end

hl('ColorColumn', { fg = nil, bg = palette.base01 })
hl('Conceal', { fg = palette.base0D, bg = nil })
hl('CurSearch', { fg = palette.base01, bg = palette.base09 })
hl('Cursor', { fg = palette.base00, bg = palette.base05 })
hl('CursorColumn', { fg = nil, bg = palette.base01 })
hl('CursorIM', { fg = palette.base00, bg = palette.base05 })
hl('CursorLine', { fg = nil, bg = palette.base01 })
hl('CursorLineFold', { fg = palette.base0C, bg = palette.base01 })
hl('CursorLineNr', { fg = palette.base04, bg = palette.base01 })
hl('CursorLineSign', { fg = palette.base03, bg = palette.base01 })
hl('DiffAdd', { fg = palette.base0B, bg = palette.base01 })
hl('DiffChange', { fg = palette.base0E, bg = palette.base01 })
hl('DiffDelete', { fg = palette.base08, bg = palette.base01 })
hl('DiffText', { fg = palette.base0D, bg = palette.base01 })
hl('Directory', { fg = palette.base0D, bg = nil })
hl('EndOfBuffer', { fg = palette.base03, bg = nil })
hl('ErrorMsg', { fg = palette.error, bg = palette.base00 })
hl('FoldColumn', { fg = palette.base0C, bg = palette.base01 })
hl('Folded', { fg = palette.base03, bg = palette.base01 })
hl('IncSearch', { fg = palette.base01, bg = palette.base09 })
hl('lCursor', { fg = palette.base00, bg = palette.base05 })
hl('LineNr', { fg = palette.base03, bg = palette.base01 })
hl('LineNrAbove', { fg = palette.base03, bg = palette.base01 })
hl('LineNrBelow', { fg = palette.base03, bg = palette.base01 })

hl('MatchParen', { fg = nil, bg = palette.base02 })
hl('ModeMsg', { fg = palette.base0B, bg = nil })
hl('MoreMsg', { fg = palette.base0B, bg = nil })
hl('MsgArea', { fg = palette.base05, bg = palette.base00 })
hl('MsgSeparator', { fg = palette.base04, bg = palette.base02 })
hl('NonText', { fg = palette.base03, bg = nil })
hl('Normal', { fg = palette.base05, bg = palette.base00 })
hl('NormalFloat', { fg = palette.base05, bg = palette.base00 })
hl('FloatBorder', { link = "WinSeparator" })
hl('NormalNC', { fg = palette.base05, bg = palette.base00 })
hl('PMenu', { fg = palette.base05, bg = palette.base01 })
hl('PMenuSbar', { fg = nil, bg = palette.base02 })
hl('PMenuSel', { fg = palette.base01, bg = palette.base05 })
hl('PMenuThumb', { fg = nil, bg = palette.base07 })
hl('Question', { fg = palette.base0D, bg = nil })
hl('QuickFixLine', { fg = nil, bg = palette.base01 })
hl('Search', { fg = palette.base01, bg = palette.base0A })
hl('SignColumn', { fg = palette.base03, bg = palette.base01 })
hl('SpecialKey', { fg = palette.base03, bg = nil })
hl('SpellBad', { fg = nil, bg = nil, undercurl = true, sp = palette.base08 })
hl('SpellCap', { fg = nil, bg = nil, undercurl = true, sp = palette.base0D })
hl('SpellLocal', { fg = nil, bg = nil, undercurl = true, sp = palette.base0C })
hl('SpellRare', { fg = nil, bg = nil, undercurl = true, sp = palette.base0E })
hl('StatusLine', { fg = palette.base02, bg = nil })
hl('StatusLineNC', { fg = palette.base02, bg = nil, sp = '#000000' })
hl('Substitute', { fg = palette.base01, bg = palette.base0A })
hl('TabLine', { fg = palette.base03, bg = palette.base01 })
hl('TabLineFill', { fg = palette.base03, bg = palette.base01 })
hl('TabLineSel', { fg = palette.base0B, bg = palette.base01 })
hl('TermCursor', { fg = nil, bg = nil, reverse = true })
hl('TermCursorNC', { fg = nil, bg = nil, reverse = true })
hl('Title', { fg = palette.base0D, bg = nil })
hl('VertSplit', { fg = palette.base02, bg = palette.base02 })
hl('Visual', { fg = nil, bg = palette.base01 })
hl('VisualNOS', { fg = palette.base08, bg = nil })
hl('WarningMsg', { fg = palette.warn, bg = nil })
hl('Whitespace', { fg = palette.base03, bg = nil })
hl('WildMenu', { fg = palette.base08, bg = palette.base0A })
hl('WinBar', { fg = palette.base04, bg = palette.base02 })
hl('WinBarNC', { fg = palette.base03, bg = palette.base01 })
hl('WinSeparator', { fg = palette.base02, bg = nil })

hl('Boolean', { fg = palette.base09, bg = nil })
hl('Character', { fg = palette.base0B, bg = nil })
hl('Comment', { fg = palette.base03, bg = nil })
hl('Conditional', { fg = palette.base0E, bg = nil })
hl('Constant', { fg = palette.base09, bg = nil })
hl('Debug', { fg = palette.base08, bg = nil })
hl('Define', { fg = palette.base0E, bg = nil })
hl('Delimiter', { fg = palette.base0F, bg = nil })
hl('Error', { fg = palette.base00, bg = palette.error })
hl('Exception', { fg = palette.base08, bg = nil })
hl('Float', { fg = palette.base09, bg = nil })
hl('Function', { fg = palette.base0D, bg = nil })
hl('Identifier', { fg = palette.base08, bg = nil })
hl('Ignore', { fg = palette.base0C, bg = nil })
hl('Include', { fg = palette.base0D, bg = nil })
hl('Keyword', { fg = palette.base0E, bg = nil })
hl('Label', { fg = palette.base0A, bg = nil })
hl('Macro', { fg = palette.base08, bg = nil })
hl('Number', { fg = palette.base09, bg = nil })
hl('Operator', { fg = palette.base05, bg = nil })
hl('PreCondit', { fg = palette.base0A, bg = nil })
hl('PreProc', { fg = palette.base0A, bg = nil })
hl('Repeat', { fg = palette.base0A, bg = nil })
hl('Special', { fg = palette.base0C, bg = nil })
hl('SpecialChar', { fg = palette.base0F, bg = nil })
hl('SpecialComment', { fg = palette.base0C, bg = nil })
hl('Statement', { fg = palette.base08, bg = nil })
hl('StorageClass', { fg = palette.base0A, bg = nil })
hl('String', { fg = palette.base0B, bg = nil })
hl('Structure', { fg = palette.base0E, bg = nil })
hl('Tag', { fg = palette.base0A, bg = nil })
hl('Todo', { fg = palette.base0A, bg = palette.base01 })
hl('Type', { fg = palette.base0A, bg = nil })
hl('Typedef', { fg = palette.base0A, bg = nil })

hl('DiagnosticError', { fg = palette.error, bg = nil })
hl('DiagnosticInfo', { fg = palette.info, bg = nil })
hl('DiagnosticWarn', { fg = palette.warn, bg = nil })
hl('DiagnosticFloatingError', { fg = palette.error, bg = palette.base01 })
hl('DiagnosticFloatingInfo', { fg = palette.info, bg = palette.base01 })
hl('DiagnosticFloatingWarn', { fg = palette.warn, bg = palette.base01 })
hl('DiagnosticSignError', { link = 'DiagnosticFloatingError' })
hl('DiagnosticSignInfo', { link = 'DiagnosticFloatingInfo' })
hl('DiagnosticSignWarn', { link = 'DiagnosticFloatingWarn' })
hl('DiagnosticUnderlineError', { fg = nil, bg = nil, underline = true, sp = palette.error })
hl('DiagnosticUnderlineInfo', { fg = nil, bg = nil, underline = true, sp = palette.info })
hl('DiagnosticUnderlineWarn', { fg = nil, bg = nil, underline = true, sp = palette.warn })

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
