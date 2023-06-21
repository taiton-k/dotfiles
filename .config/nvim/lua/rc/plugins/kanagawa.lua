return {
        "rebelot/kanagawa.nvim",
        config = function()
                require("kanagawa").setup({
                        compile = true,
                        theme = "wave",
                        overrides = function(colors)
                                local transparent = false

                                local config = { }

                                if transparent then
                                        config = {
                                                Normal = {
                                                        bg = "NONE"
                                                },
                                                NormalNC = {
                                                        link = "NONE"
                                                },
                                                WinSeparator = {
                                                        fg = colors.palette.sumiInk6,
                                                },
                                                StatusLine = {
                                                        fg = colors.palette.sumiInk6,
                                                        bg = "NONE",
                                                        nocombine = true
                                                },
                                                StatusLineNC = {
                                                        fg = colors.palette.sumiInk6,
                                                        bg = "NONE",
                                                },
                                                FloatBorder = {
                                                        link = "WinSeparator"
                                                },
                                                MsgArea = {
                                                        link = "Normal"
                                                }
                                        }
                                else
                                        config = {
                                                WinSeparator = {
                                                        fg = colors.palette.sumiInk6,
                                                },
                                                FloatBorder = {
                                                        link = "WinSeparator"
                                                }
                                        }
                                end

                                return config
                        end
                })

                vim.cmd.color("kanagawa")
        end
}
