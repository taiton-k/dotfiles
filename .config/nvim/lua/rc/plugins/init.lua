local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable",
                lazypath,
        })
end

vim.opt.rtp:prepend(lazypath)



require("lazy").setup({
        require("rc.plugins.treesitter"),
        require("rc.plugins.indent-blankline"),
        require("rc.plugins.ddc"),
        require("rc.plugins.ddu"),
        require("rc.plugins.nvim-lspconfig"),
        "vim-jp/vimdoc-ja",
        {
                "windwp/nvim-autopairs",
                lazy = true,
                event = "InsertEnter",
                opts = {
                        map_c_h = true,
                        map_cr = true,
                }
        },
        {
                "vim-denops/denops.vim",
                lazy = true,
                config = function(this_plugin)
                        vim.g.denops_server_addr = "127.0.0.1:32123"

                        vim.fn.jobstart(
                                "deno run -A --no-check " .. this_plugin.dir .. "/denops/@denops-private/cli.ts",
                                { detach = true }
                        )
                end
        },
        {
                "yuki-yano/denops-lazy.nvim",
                lazy = true,
                opts = {
                        wait_load = false,
                        wait_server = false,
                }
        },
        {
                "vim-skk/skkeleton",
                lazy = true,
                dependencies = { "denops.vim", "denops-lazy.nvim", "ddc.vim" },
                keys = { {
                        "<C-j>",
                        "<Plug>(skkeleton-toggle)",
                        mode = 'i'
                } },
                config = function()
                        require("denops-lazy").load("skkeleton")

                        local skk_config = {
                                eggLikeNewline = true,
                                globalJisyo = "/usr/share/skk/SKK-JISYO.L",
                                keepState = true,
                                markerHenkan = "▽ ",
                                markerHenkanSelect = "▼ ",
                                registerConvertResult = true,
                                usePopup = true,
                                setUndoPoint = true,
                                userJisyo = "~/.config/skk/user.dict",
                                completionRankFile = "~/.config/skk/skk-rank"
                        }

                        vim.api.nvim_create_autocmd("User", {
                                pattern = "skkeleton-initialize-pre",
                                callback = function()
                                        vim.fn["skkeleton#config"](skk_config)
                                end
                        })

                        local prev_config
                        vim.api.nvim_create_autocmd("User", {
                                pattern = "skkeleton-enable-pre",
                                callback = function()
                                        prev_config = vim.fn["ddc#custom#get_current"]()
                                        vim.fn["ddc#custom#patch_buffer"]("sources", { "skkeleton" })
                                end
                        })
                        vim.api.nvim_create_autocmd("User", {
                                pattern = "skkeleton-disable-pre",
                                callback = function()
                                        vim.fn["ddc#custom#patch_buffer"](prev_config)
                                end
                        })
                        vim.keymap.set({ 'i', 'c' }, "<C-j>", "<Plug>(skkeleton-toggle)")
                end
        },
        {
                "akinsho/toggleterm.nvim",
                opts = {
                        open_mapping = "<C-t>",
                        start_in_insert = true,
                        insert_mappings = true,
                        terminal_mappings = true,
                        highlights = {
                                FloatBorder = {
                                        link = "WinSeparator"
                                }
                        },
                        direction = "float",
                        float_opts = {
                                border = "rounded"
                        }
                }
        },
        {
                "uga-rosa/ccc.nvim",
                config = function ()
                        local ccc = require("ccc")
                        ccc.setup({
                                highlighter = {
                                        auto_enable = true
                                },
                                inputs = {
                                        ccc.input.rgb,
                                        ccc.input.hsl,
                                        ccc.input.hsv
                                }
                        })
                end
        },
        {
                "Exafunction/codeium.vim",
                lazy = true,
                config = function ()
                        vim.g.codeium_disable_bindings = 1
                        vim.g.codeium_render = false
                        vim.g.codeium_filetypes = {
                                ["ddu-ff-filter"] = false
                        }
                end
        }
})
