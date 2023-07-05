return {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = {
                {
                        url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
                        lazy = true,
                        config = true
                },
                {
                        "matsui54/denops-popup-preview.vim",
                        lazy = true,
                        dependencies = { "denops.vim", "denops-lazy.nvim" },
                        config = function()
                                require("denops-lazy").load("denops-popup-preview.vim")
                                vim.fn["popup_preview#enable"]()
                        end
                },
                {
                        "matsui54/denops-signature_help",
                        lazy = true,
                        dependencies = { "denops.vim", "denops-lazy.nvim" },
                        config = function()
                                require("denops-lazy").load("denops-signature_help")
                                vim.fn["signature_help#enable"]()
                        end
                }
        },
        ft = {
                "cpp",
                "lua",
                "rust"
        },
        config = function()
                vim.diagnostic.config({
                        virtual_text = false,
                        update_in_insert = false
                })

                local diagnostic_is_enabled = true
                vim.api.nvim_create_autocmd("LspAttach", {
                        pattern = '*',
                        callback = function()
                                vim.api.nvim_create_autocmd("InsertEnter", {
                                        buffer = 0,
                                        callback = function()
                                                if diagnostic_is_enabled then
                                                        vim.diagnostic.disable(0)
                                                end
                                        end
                                })

                                vim.api.nvim_create_autocmd("CursorHold", {
                                        buffer = 0,
                                        callback = function()
                                                if diagnostic_is_enabled then
                                                        vim.diagnostic.enable(0)
                                                end
                                        end
                                })

                                vim.keymap.set('n', "<Leader>l",
                                        function()
                                                if diagnostic_is_enabled then
                                                        diagnostic_is_enabled = false
                                                        vim.diagnostic.disable(0)
                                                else
                                                        diagnostic_is_enabled = true
                                                        vim.diagnostic.enable(0)
                                                end
                                        end, {
                                                buffer = true
                                        })

                                vim.keymap.set('n', "<Leader>f", "<Cmd>LspFormat<CR>")

                                vim.keymap.set('n', "<C-k>", vim.diagnostic.open_float, { buffer = true })
                                vim.keymap.set('n', "K", vim.lsp.buf.hover, { buffer = true })
                        end
                })

                local function wrapper(func)
                        return function()
                                func()
                        end
                end

                vim.api.nvim_create_user_command("LspRename", wrapper(vim.lsp.buf.rename), {})
                vim.api.nvim_create_user_command("LspDeclaration", wrapper(vim.lsp.buf.declaration), {})
                vim.api.nvim_create_user_command("LspTypeDefinition", wrapper(vim.lsp.buf.type_definition), {})
                vim.api.nvim_create_user_command("LspImplementation", wrapper(vim.lsp.buf.implementation), {})
                vim.api.nvim_create_user_command("LspDefinition", wrapper(vim.lsp.buf.definition), {})
                vim.api.nvim_create_user_command("LspHover", wrapper(vim.lsp.buf.hover), {})
                vim.api.nvim_create_user_command('LspFormat', wrapper(vim.lsp.buf.format), {})



                local lspconfig = require("lspconfig")

                lspconfig.lua_ls.setup({
                        settings = {
                                Lua = {
                                        runtime = {
                                                version = "LuaJIT"
                                        },
                                        diagnostics = {
                                                globals = { "vim" }
                                        },
                                        workspace = {
                                                library = vim.api.nvim_get_runtime_file('', true),
                                        },
                                        telemetry = {
                                                enable = false
                                        }
                                }
                        }
                })

                lspconfig.clangd.setup({})

                lspconfig.rust_analyzer.setup({})

                vim.cmd.LspStart()
        end
}
