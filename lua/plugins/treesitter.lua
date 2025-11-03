local settings = require("core.settings")

return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            -- A list of parser names, or "all"
            ensure_installed = settings.treesitter_deps,
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
            highlight = { enable = true },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    },
}
