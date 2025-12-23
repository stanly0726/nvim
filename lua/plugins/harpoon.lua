---@module "lazy"
---@type LazySpec
return {
    'theprimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
    end,
    keys = {
        {
            '<leader>a',
            function()
                require("harpoon"):list():add()
            end,
            desc = "harpoon: add item"
        },
        {
            '<C-j>',
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "harpoon: open menu"
        },
        {
            '<C-n>',
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "harpoon: open first item"
        },
        {
            '<C-e>',
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "harpoon: open second item"
        },
    }
}
