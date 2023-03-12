return {
    'theprimeagen/harpoon',
    keys = {
        { '<leader>a', function()
            require("harpoon.mark").add_file()
        end },
        { '<C-e>', function()
            require("harpoon.ui").toggle_quick_menu()
        end },
        { '<C-h>', function()
            require("harpoon.ui").nav_file(1)
        end },
        { '<C-l>', function()
            require("harpoon.ui").nav_file(2)
        end },
    }
}
