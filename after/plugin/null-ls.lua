local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.blade_formatter.with({
            extra_args = { "--sort-tailwindcss-classes", "--sort-html-attributes", "--no-multiple-empty-lines" },
        }),
    },
    -- debug = true,
})
