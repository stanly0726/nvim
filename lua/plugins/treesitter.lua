local settings = require("core.settings")

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter").install(settings.treesitter_deps)
    end
}
