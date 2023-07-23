return {
        "Shougo/ddu.vim",
        lazy = true,
        dependencies = {
                "denops.vim",
                "denops-lazy.nvim",
                "Shougo/ddu-commands.vim",
                "Shougo/ddu-ui-ff",
                "Shougo/ddu-kind-file",
                "Shougo/ddu-kind-word",
                "Shougo/ddu-source-file",
                "Shougo/ddu-source-file_rec",
                "Shougo/ddu-source-file_old",
                "uga-rosa/ddu-source-lsp",
                "matsui54/ddu-source-help",
                "4513ECHO/ddu-source-source",
                "Shougo/ddu-source-action",
                "Shougo/ddu-filter-matcher_relative",
                "yuki-yano/ddu-filter-fzf",
                "tamago3keran/ddu-column-devicon_filename"
        },
        cmd = "Ddu",
        config = function()
                require("denops-lazy").load("ddu.vim")

                local winHeight = math.floor(vim.o.lines / 2)
                local winWidth = math.floor(vim.o.columns * 3 / 8)
                local winRow = math.floor(vim.o.lines / 4) - 3
                local winCol = math.floor(vim.o.columns / 8)

                vim.fn["ddu#custom#patch_global"]({
                        ui = "ff",
                        uiParams = {
                                ff = {
                                        autoAction = {
                                                name = "preview"
                                        },
                                        startAutoAction = true,
                                        filterFloatingPosition = "bottom",
                                        floatingBorder = "rounded",
                                        floatingTitlePos = "center",
                                        split = "floating",
                                        previewFloating = true,
                                        previewFloatingBorder = "rounded",
                                        previewFloatingTitle = { { "Preview", "FloatBorder" } },
                                        previewFloatingTitlePos = "center",
                                        previewFloatingZindex = 51,
                                        prompt = '>',
                                        winHeight = winHeight,
                                        winWidth = winWidth * 2 + 2,
                                        winRow = winRow,
                                        winCol = winCol,
                                        previewHeight = winHeight,
                                        previewWidth = winWidth + 2,
                                        previewRow = winRow + winHeight + 2,
                                        previewCol = winCol + winWidth
                                }
                        },
                        kindOptions = {
                                file = {
                                        defaultAction = "open"
                                },
                                word = {
                                        defaultAction = "append"
                                },
                                action = {
                                        defaultAction = "do"
                                },
                                source = {
                                        defaultAction = "execute"
                                },
                                help = {
                                        defaultAction = "open"
                                }
                        },
                        sourceOptions = {
                                _ = {
                                        matchers = { "matcher_fzf" },
                                        ignoreCase = true
                                },
                                file = {
                                        columns = { "devicon_filename" }
                                },
                                file_rec = {
                                        columns = { "devicon_filename" }
                                },
                                file_old = {
                                        columns = { "devicon_filename" }
                                }
                        },
                        sourceParams = {
                                lsp_diagnostic = {
                                        clientName = "nvim-lsp"
                                }
                        },
                        filterParams = {
                                matcher_fzf = {
                                        highlightMatched = "ModeMsg"
                                }
                        }
                })



                local function set_action(lhs, action)
                        vim.keymap.set({ 'i', 'n' }, lhs, function()
                                vim.fn["ddu#ui#do_action"](action)
                        end, {
                                buffer = true,
                                expr = false
                        })
                end

                vim.api.nvim_create_autocmd("FileType", {
                        pattern = "ddu-ff",
                        callback = function()
                                vim.opt.signcolumn       = "no"
                                vim.opt_local.cursorline = true
                                set_action("<CR>", "itemAction")
                                set_action('/', "openFilterWindow")
                                set_action("<Tab>", "toggleSelectItem")
                                set_action('q', "quit")
                                set_action('a', "chooseAction")
                                set_action('p', "preview")
                        end
                })

                vim.api.nvim_create_autocmd("FileType", {
                        pattern = "ddu-ff-filter",
                        callback = function()
                                vim.keymap.set('i', "<CR>",
                                        "<Cmd>stopinsert | call ddu#ui#do_action('leaveFilterWindow')<CR>", {
                                                buffer = true
                                        })
                                vim.keymap.set('n', "<CR>", "<Cmd>call ddu#ui#do_action('leaveFilterWindow')<CR>", {
                                        buffer = true
                                })
                                vim.keymap.set('n', "q", "<Cmd>call ddu#ui#do_action('quit')<CR>", {
                                        buffer = true
                                })
                        end
                })
        end,
        init = function()
                local set = vim.keymap.set
                set('n', "<Leader>d", "<Cmd>Ddu source<CR>")
                set('n', "<Leader>df", "<Cmd>Ddu file_rec<CR>")
                set('n', "<Leader>do", "<Cmd>Ddu file_old<CR>")
                set('n', "<Leader>dh", "<Cmd>Ddu help<CR>")
                set('n', "<Leader>dl", "<Cmd>Ddu lsp_diagnostic<CR>")
        end
}
