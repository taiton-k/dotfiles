return {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
                {
                        "andymass/vim-matchup",
                        lazy = true
                }
        },
        config = function ()
                require('nvim-treesitter.configs').setup({
                        highlight = {
                                enable = true
                        },
                        indent = {
                                enable = false
                        },
                        matchup = {
                                enable = true,
                        }
                })

                vim.g.inden_blangline_use_treesitter = true
        end
}
