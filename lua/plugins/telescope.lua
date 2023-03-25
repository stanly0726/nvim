return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    opts = {
        pickers = {
            find_files = {
                no_ignore_parent = true
            }
        }
    },
    keys = {
        -- find, use to move or navigate through files or buffers
        {
            '<leader>ff',
            function()
                require("telescope.builtin").find_files()
            end,
            desc =
            "fuzzy find file in directory"
        },
        { "<leader>fb", "<Cmd>Telescope buffers<CR>",                   desc = "Find buffers" },
        -- search, search words in numerous sources
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find in current buffer" },
        {
            '<leader>sW',
            function()
                require("telescope.builtin").grep_string()
            end,
            desc =
            "search the word under cursor in cwd"
        },
        {
            '<leader>sw',
            function()
                require("telescope.builtin").live_grep()
            end,
            desc =
            "search for word in cwd"
        },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>",   desc = "Key Maps" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    },
    cmd = "Telescope",
    dependencies = {
        'plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                require("telescope").load_extension("fzf")
            end
        }
    }
}
