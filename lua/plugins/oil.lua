---@module "lazy"
---@type LazySpec
return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        -- default_file_explorer = false,
        delete_to_trash = true,
        view_options = {
            show_hidden = true,
        },
        float = {
            max_width = 0.6,
        },
        keymaps = {
            ["<C-s>"] = false,
            ["<C-v>"] = { "actions.select", opts = { vertical = true } },
            ["gd"] = {
                desc = "Toggle file detail view",
                callback = function()
                    Oil_detail = not Oil_detail
                    if Oil_detail then
                        require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                    else
                        require("oil").set_columns({ "icon" })
                    end
                end,
            },
        },
    },
    keys = { { "-", "<cmd>Oil --float<cr>", desc = "Oil: open oil menu" } },
    -- Optional dependencies
    dependencies = { { 'nvim-mini/mini.nvim', version = false, setup = require('mini.icons').setup() } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
