return {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
                require('indent_blankline').setup({
                        char_highlight_list = {
                                "Special",
                                "Function",
                                "Type",
                        },
                        space_char_highlight_list = {
                                "Special",
                                "Function",
                                "Type",
                        },
                        show_trailing_blankline_indent = false,
                        filetype_exclude = { 'help' },
                        buftype_exclude = { 'terminal' },
                })

                vim.api.nvim_create_autocmd("WinScrolled", {
                        command = "IndentBlanklineRefresh"
                })
        end
}
