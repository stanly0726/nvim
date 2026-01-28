local settings = require("core.settings")

---@module "lazy"
---@type LazySpec
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
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        main = "everforest",
        opts = {
            italics = true,
            transparent_background_level = settings["transparent_background"] and 1 or 0,
            background = "medium",
        },
    }
}
