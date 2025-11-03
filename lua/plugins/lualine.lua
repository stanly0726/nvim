return {
    'nvim-lualine/lualine.nvim',
    -- event = { "BufReadPost", "BufAdd", "BufNewFile" },
    event = { 'VeryLazy' },
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            icons_enabled = true,
            theme = require('core.settings')['colorscheme'],
            disabled_filetypes = { 'oil' },
        },
        sections = {
            lualine_c = { { 'filename', path = 1 } },
        },
    }
}
