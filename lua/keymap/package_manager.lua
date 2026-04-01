local bind = require("keymap.bind")
local map_callback = bind.map_callback

local mappings = {
    lazy = {
        -- Package manager: lazy.nvim
        ["n|<leader>pu"] = map_callback(vim.pack.update)
            :with_noremap()
            :with_desc("package: Update"),
        ["n|<leader>pp"] = map_callback(function()
                vim.pack.update(nil, { offline = true })
            end)
            :with_noremap()
            :with_desc("package: List"),
        ["n|<leader>pr"] = map_callback(function()
                vim.pack.update(nil, { target = 'lockfile' })
            end)
            :with_noremap()
            :with_desc("package: Restore"),
    },
}

bind.nvim_load_mapping(mappings.lazy)
