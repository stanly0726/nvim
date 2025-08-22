return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = {},
        indent = {
            animate = {
                enabled = false
            }
        },
        scroll = {
            enabled = vim.g.neovide,
            animate = {
                easing = "outSine",
            } 
        },
    },
    keys = {
        { "<leader>ff", function() Snacks.picker.smart() end,       desc = "Find: file" },
        { "<leader>fb", function() Snacks.picker.buffers() end,     desc = "Find: Buffers" },

        { "<leader>sh", function() Snacks.picker.help() end,        desc = "Search: Help Pages" },
        { "<leader>sk", function() Snacks.picker.keymaps() end,     desc = "Search: Keymaps" },
        { "<leader>sw", function() Snacks.picker.grep() end,        desc = "Search: Word(workspace)" },

        { "<leader>ss", function() Snacks.picker() end,             desc = "Snacks picker" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Snacks diagnostics" },
        { "<leader>e",  function() Snacks.explorer() end,           desc = "Explorer" },
        { "<leader>gg", function() Snacks.lazygit() end,            { desc = "Lazygit" } },
    },
}
