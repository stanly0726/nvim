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
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = settings.transparent_background,
            background = {
                light = "lotus",
                dark = "dragon"
            },
        }
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
    }
}
