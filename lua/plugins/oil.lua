return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
        -- default_file_explorer = false,
        delete_to_trash = true,
    },
    cmd = { 'Oil' },
    keys = { { "-", "<cmd>Oil<cr>" } },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
