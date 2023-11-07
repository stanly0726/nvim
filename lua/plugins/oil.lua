return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = false,
    },
    cmd = { 'Oil' },
    keys = { { "<leader>o", "<cmd>Oil<cr>" } },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
