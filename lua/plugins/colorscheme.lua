local settings = require("core.settings")

return {
    -- {
    --     'shaunsingh/nord.nvim',
    --     config = function()
    --         vim.g.nord_disable_background = settings.transparent_background
    --         vim.g.nord_italic = false
    --
    --         -- Load the colorscheme
    --         require('nord').set()
    --     end
    -- },
    {
        "gbprod/nord.nvim",
        opts = {
            transparent = settings.transparent_background,
            errors = { mode = "fg" },
        },
    },
    -- {
    --     'AlexvZyl/nordic.nvim',
    --     config = function()
    --         local nordic = require('nordic')
    --         nordic.setup({
    --             transparent = {
    --                 bg = settings.transparent_background,
    --             },
    --         })
    --         nordic.load()
    --     end
    -- }
}
