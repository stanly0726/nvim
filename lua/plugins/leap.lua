return {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
        vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)', {desc = "leap search forward"})
        vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', {desc = "leap search backward"})
        vim.keymap.set({ 'n', 'x', 'o' }, ',', '<Plug>(leap-from-window)', {desc = "leap across window"})
    end
}
