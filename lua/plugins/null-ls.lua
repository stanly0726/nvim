return {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
        local null_ls = require('null-ls')
        return {
            sources = {
                null_ls.builtins.formatting.blade_formatter.with({
                    extra_args = { "--sort-tailwindcss-classes", "--sort-html-attributes",
                        "--no-multiple-empty-lines" },
                }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettierd,
            },
            -- debug = true,
        }
    end,
    dependencies = { 'plenary.nvim', 'lsp-zero.nvim' }
}
