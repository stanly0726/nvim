local settings = require("core.settings")

return {
    {
        "gbprod/nord.nvim",
        opts = {
            transparent = settings.transparent_background,
            errors = { mode = "fg" },
        },
    },
    {
        'AlexvZyl/nordic.nvim',
        config = function()
            local nordic = require('nordic')
            nordic.setup({
                transparent = {
                    bg = settings.transparent_background,
                },
            })
            nordic.load({})
        end
    },
    {
        "rebelot/kanagawa.nvim",
        opts = {
            compile = true,
            transparent = settings.transparent_background,
            background = {
                light = "lotus",
                dark = "dragon"
            },
        }
    },
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.everforest_enable_italic = true
            vim.g.everforest_transparent_background = settings.transparent_background
            vim.g.everforest_background = "medium"
        end
    }
}
