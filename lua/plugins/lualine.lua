return {
    'nvim-lualine/lualine.nvim',
    -- event = { "BufReadPost", "BufAdd", "BufNewFile" },
    event = { 'VeryLazy' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'nord',
            disabled_filetypes = { 'NvimTree' },
            ignore_focus = { 'NvimTree' },
        },
        sections = {
            lualine_c = { { 'filename', path = 1 } },
        },
    }
}
