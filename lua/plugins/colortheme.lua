return {
    -- {
    --     'shaunsingh/nord.nvim',
    --     lazy = true,
    --     priority = 1000,
    --     config = function()
    --         -- Example config in lua
    --         vim.g.nord_contrast = true
    --         vim.g.nord_borders = true
    --         vim.g.nord_disable_background = true
    --         vim.g.nord_italic = false
    --
    --         -- Load the colorscheme
    --         require('nord').set()
    --     end
    -- },
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            errors = { mode = "fg" },
        },
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local nordic = require('nordic')
            nordic.setup({
                transparent_bg = true,
            })
            nordic.load()
        end
    }
}
