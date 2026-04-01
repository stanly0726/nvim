vim.schedule(function()
    vim.pack.add({
        'https://github.com/tpope/vim-repeat',
        'https://codeberg.org/andyg/leap.nvim.git'
    })

    vim.keymap.set({ 'n', 'x', 'o' }, ',', '<Plug>(leap)', { desc = "leap" })
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', {desc = "leap search backward"})
    vim.keymap.set({ 'n', 'x', 'o' }, '<leader>,', '<Plug>(leap-from-window)',
        { desc = "leap across window" })
end)
