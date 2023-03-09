local null_ls = require('null-ls')
local sources = {
    null_ls.builtins.formatting.blade_formatter.with({
        timeout = 10000,
    }),
}

null_ls.setup({
    sources = sources,
    -- debug = true,
})
