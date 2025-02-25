return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
        -- default_file_explorer = false,
    },
    cmd = { 'Oil' },
    keys = { { "-", "<cmd>Oil<cr>" } },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
