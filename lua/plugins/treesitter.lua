return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        build = ':TSUpdate',
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- A list of parser names, or "all"
            ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
            highlight = {
                -- `false` will disable the whole extension
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            require('ts_context_commentstring').setup {
                enable_autocmd = false,
            }
        end
    }
}
