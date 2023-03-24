return {
    'abecodes/tabout.nvim',
    event = {
        "BufRead",
    },
    opts = { ignore_beginning = false },
    dependencies = { 'nvim-treesitter' }
}
