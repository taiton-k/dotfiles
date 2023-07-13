return {
        "Shougo/ddc.vim",
        lazy = true,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
                "denops.vim",
                "denops-lazy.nvim",
                {
                        "Shougo/pum.vim",
                        lazy = true,
                        config = function()
                                vim.fn["pum#set_option"]({
                                        min_width = 25,
                                        padding = true,
                                        scrollbar_char = ' ',
                                        use_setline = true
                                })

                                vim.api.nvim_create_autocmd("FileType", {
                                        pattern = "ddu-ff-filter",
                                        callback = function()
                                                vim.fn["pum#set_buffer_option"]({
                                                        direction = "above"
                                                })
                                        end
                                })
                        end
                },
                "Shougo/ddc-ui-pum",
                "Shougo/ddc-source-codeium",
                "Shougo/ddc-source-around",
                "Shougo/ddc-source-nvim-lsp",
                "LumaKernel/ddc-source-file",
                "Shougo/ddc-source-nvim-lua",
                "Shougo/ddc-source-cmdline",
                "matsui54/ddc-buffer",
                "Shougo/ddc-source-cmdline-history",
                "Shougo/ddc-source-input",
                "Shougo/ddc-source-line",
                "Shougo/ddc-filter-matcher_head",
                "Shougo/ddc-filter-matcher_length",
                "Shougo/ddc-filter-matcher_prefix",
                "Shougo/ddc-filter-matcher_vimregexp",
                "Shougo/ddc-filter-sorter_rank",
                "Shougo/ddc-converter_remove_overlap",
                "Shougo/ddc-filter-converter_truncate_abbr",
                -- "matsui54/ddc-converter_truncate",
                "tani/ddc-fuzzy"
        },
        config = function()
                require("denops-lazy").load("ddc.vim")

                vim.fn["ddc#custom#patch_global"]({
                        ui = "pum",
                        backspaceCompletion = true,
                        sources = { "codeium", "around", "file" },
                        sourceOptions = {
                                _ = {
                                        ignoreCase = true,
                                        matchers = { "matcher_head", "matcher_prefix", "matcher_length", "matcher_fuzzy" },
                                        sorters = { "sorter_rank", "sorter_fuzzy" },
                                        converters = { "converter_fuzzy", "converter_remove_overlap",
                                                "converter_truncate_abbr" }
                                },
                                around = {
                                        mark = 'A'
                                },
                                buffer = {
                                        mark = "buf"
                                },
                                ["nvim-lua"] = {
                                        mark = 'Lua',
                                        forceCompletionPattern = [[\.\w*|:\w*|->\w*]]
                                },
                                cmdline = {
                                        mark = "cmdline",
                                        forceCompletionPattern = [[\S/\S*|\.\w*]],
                                        dup = "force"
                                },
                                codeium = {
                                        mark = "cod",
                                        matchers = { "matcher_length" },
                                        minAutoCompleteLength = 0,
                                        isVolatile = true
                                },
                                input = {
                                        mark = "input",
                                        forceCompletionPattern = [[\S/\S*]],
                                        dup = "force"
                                },
                                line = {
                                        mark = "line",
                                        matchers = { "matcher_vimregexp" }
                                },
                                ["nvim-lsp"] = {
                                        mark = "lsp",
                                        forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
                                        dup = "force",
                                        converters = { "converter_kind_labels" }
                                },
                                file = {
                                        mark = "file",
                                        isVolatile = true,
                                        forceCompletionPattern = [[\S\/S*]]
                                },
                                ["cmdline-history"] = {
                                        mark = "history",
                                        sorters = {}
                                },
                                skkeleton = {
                                        mark = "skk",
                                        matchers = { "skkeleton" },
                                        sorters = {},
                                        isVolatile = true
                                }
                        },
                        sourceParams = {
                                buffer = {
                                        requireSameFiletype = false,
                                        limitBytes = 50000,
                                        fromAltBuf = true,
                                        forceCollect = true
                                },
                                file = {
                                        filenameChars = "[:keyword:]"
                                }
                        },
                        filterParams = {
                                converter_truncate_abbr = {
                                        maxAbbrWidth = 60
                                },
                                converter_kind_labels = {
                                        kindLabels = {
                                                Text          = "󰉿 ",
                                                Method        = "󰆧 ",
                                                Function      = "󰊕 ",
                                                Constructor   = " ",
                                                Field         = "󰜢 ",
                                                Variable      = " ",
                                                Class         = "󰠱 ",
                                                Interface     = " ",
                                                Module        = " ",
                                                Property      = "󰜢 ",
                                                Unit          = "󰑭 ",
                                                Value         = "󰎠 ",
                                                Enum          = " ",
                                                Keyword       = "󰌋 ",
                                                Snippet       = " ",
                                                Color         = "󰏘 ",
                                                File          = "󰈙 ",
                                                Reference     = "󰈇 ",
                                                Folder        = "󰉋 ",
                                                EnumMember    = " ",
                                                Constant      = "󰏿 ",
                                                Struct        = "󰙅 ",
                                                Event         = " ",
                                                Operator      = "󰆕 ",
                                                TypeParameter = "TP",
                                        }
                                }
                        },
                        autoCompleteEvents = {
                                "InsertEnter",
                                "TextChangedI",
                                "TextChangedP",
                                "CmdlineEnter",
                                "CmdlineChanged"
                        },
                        cmdlineSources = {
                                [':'] = { "cmdline", "cmdline-history", "around" },
                                ['@'] = { "cmdline-history", "input", "file", "around" },
                                ['>'] = { "cmdline-history", "input", "file", "around" },
                                ['/'] = { "around", "line" },
                                ['?'] = { "around", "line" },
                                ['-'] = { "around", "line" },
                                ['='] = { "input" }
                        }
                })

                vim.fn["ddc#custom#patch_filetype"]("ddu-ff-filter", {
                        keywordPattern = "[0-9a-zA-Z_:#-]*",
                        sources = { "line", "buffer" },
                        specialBufferCompletion = true
                })

                vim.fn["ddc#custom#patch_filetype"]({ "cpp" }, {
                        sources = { "codeium", "nvim-lsp", "around" }
                })

                vim.fn["ddc#custom#patch_filetype"]("lua", {
                        sources = { "codeium", "nvim-lua", "nvim-lsp", "around" }
                })



                vim.keymap.set('i', "<Tab>",
                        function()
                                if vim.fn["pum#visible"]() then
                                        return "<Cmd>call pum#map#insert_relative(+1)<CR>"
                                elseif vim.api.nvim_eval([[(col('.') <= 1 || getline('.')[col('.') - 2] =~# '\s')]]) == 1 then
                                        return "<Tab>"
                                else
                                        return vim.fn["ddc#map#manual_complete"]()
                                end
                        end, {
                                expr = true
                        }
                )
                vim.keymap.set('c', "<Tab>",
                        function()
                                if vim.fn["pum#visible"]() then
                                        return "<Cmd>call pum#map#insert_relative(+1)<CR>"
                                else
                                        return vim.fn["ddc#map#manual_complete"]()
                                end
                        end, {
                                expr = true,
                        }
                )
                vim.keymap.set({ 'i', 'c' }, "<S-Tab>", "<Cmd>call pum#map#insert_relative(-1)<CR>")
                vim.keymap.set({ 'i', 'c' }, "<C-y>",
                        function()
                                if vim.fn["pum#visible"]() then
                                        return "<Cmd>call pum#map#confirm()<CR>"
                                else
                                        return "<C-y>"
                                end
                        end, {
                                expr = true,
                        }
                )
                vim.keymap.set({ 'i', 'c' }, "<C-e>",
                        function()
                                if vim.fn["pum#visible"]() then
                                        return "<Cmd>call pum#map#cancel()<CR>"
                                else
                                        return "<End>"
                                end
                        end, {
                                expr = true,
                        }
                )
                vim.keymap.set({ 'i', 'c' }, "<C-l>", function ()
                        vim.fn["pum#map#cancel"]()
                        return vim.fn["ddc#map#manual_complete"]()
                end, {
                        expr = true
                })

                vim.fn["ddc#enable"]()
                vim.fn["ddc#enable_cmdline_completion"]()
        end
}
