return {
    'theprimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
    end,
    keys = {
        { '<leader>a', function()
            require("harpoon"):list():append()
        end },
        { '<C-j>', function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end },
        { '<C-n>', function()
            require("harpoon"):list():select(1)
        end },
        { '<C-e>', function()
            require("harpoon"):list():select(2)
        end },
    }
}
