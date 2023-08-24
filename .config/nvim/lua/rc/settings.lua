vim.cmd("filetype plugin off")

vim.g.loaded_2html_plugin       = 1
vim.g.loaded_gzip               = 1
vim.g.loaded_tar                = 1
vim.g.loaded_tarPlugin          = 1
vim.g.loaded_zip                = 1
vim.g.loaded_zipPlugin          = 1
vim.g.loaded_vimball            = 1
vim.g.loaded_vimballPlugin      = 1
vim.g.loaded_netrw              = 1
vim.g.loaded_netrwPlugin        = 1
vim.g.loaded_netrwSettings      = 1
vim.g.loaded_netrwFileHandlers  = 1
vim.g.loaded_getscript          = 1
vim.g.loaded_getscriptPlugin    = 1
vim.g.loaded_man                = 1
vim.g.loaded_matchit            = 1
vim.g.loaded_matchparen         = 1
vim.g.loaded_shada_plugin       = 1
vim.g.loaded_spellfile_plugin   = 1
vim.g.loaded_tutor_mode_plugin  = 1
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu   = 1
vim.g.skip_loading_mswin        = 1
vim.g.did_indent_on             = 1
vim.g.did_load_ftplugin         = 1
vim.g.loaded_rrhelper           = 1

vim.g.editorconfig              = false

vim.g.mapleader                 = " "

vim.opt.cursorline              = false
vim.opt.cursorcolumn            = false

vim.opt.mouse                   = "nvr"

vim.opt.wrap                    = false

vim.opt.wrapscan                = true

vim.opt.whichwrap               = {
        b = true,
        s = true,
        h = true,
        l = true,
        ['['] = true,
        [']'] = true,
        ['<'] = true,
        ['>'] = true,
        ['~'] = true
}

vim.opt.tabstop                 = 8
vim.opt.softtabstop             = -1
vim.opt.shiftwidth              = 0
vim.opt.expandtab               = true
vim.opt.shiftround              = true
vim.opt.autoindent              = true
vim.opt.smartindent             = true
vim.opt.cindent                 = true
vim.opt.smarttab                = true
vim.g.vim_indent_cont           = 8

vim.opt.fileencoding            = "utf-8"
vim.opt.fileencodings           = { "utf-8", "cp932", "euc-jp", "ucs-boms" }
vim.opt.fileformats             = { "unix", "dos", "mac" }

vim.opt.ambiwidth               = "single"
vim.opt.emoji                   = true

vim.opt.incsearch               = true
vim.opt.ignorecase              = true
vim.opt.smartcase               = true
vim.opt.hlsearch                = true

vim.opt.termguicolors           = true

vim.opt.pumblend                = 15
vim.opt.pumheight               = 30
vim.opt.pumwidth                = 10
vim.opt.winblend                = 15

vim.opt.hidden                  = true

vim.opt.splitright              = true
vim.opt.splitbelow              = true

vim.opt.clipboard:prepend("unnamedplus")

vim.opt.list = true
vim.opt.listchars = {
        eol = '󱞣',
        tab = '  ',
}
vim.opt.fillchars:append({
        fold = ' ',
        eob = ' ',
        stl = '─',
        stlnc = '─'
})

vim.opt.signcolumn = "no"
vim.opt.laststatus = 0
vim.opt.showtabline = 0
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.display = "lastline"
vim.opt.shortmess = "aTcF"
vim.opt.ruler = false

vim.opt.history = 2000

vim.opt.matchpairs:append("<:>")
vim.opt.showmatch = false

vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 6
vim.opt.scrolloff = 6

vim.opt.modeline = false
vim.opt.modelines = 0

vim.opt.helplang = "ja"

vim.opt.updatetime = 750
vim.opt.updatecount = 50

vim.opt.virtualedit = "block"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldtext = "getline(v:foldstart) . ' ... ' . trim(getline(v:foldend))"
vim.opt.foldtext = "v:lua.myFoldText(v:foldstart, v:foldend)"
vim.opt.foldlevel = 1000
vim.opt.foldopen = {
        mark = true,
        parcent = true,
        search = true,
        undo = true,
}

vim.opt.statusline = "%="



vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
                vim.opt_local.wrap = true
        end
})

vim.api.nvim_create_autocmd("FileType", {
        pattern = "text",
        callback = function()
                vim.opt_local.wrap = true
        end
})
