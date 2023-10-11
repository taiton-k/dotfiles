return {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
                require("ibl").setup({
                        indent = {
                                char = "┋",
                                highlight = {
                                        "IndentBlankLine"
                                }
                        },
                        scope = {
                                show_start = false,
                                highlight = {
                                        "IndentBlankLineScope"
                                }
                        }
                })
        end
}
