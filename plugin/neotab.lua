vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
        vim.pack.add({ 'https://github.com/kawre/neotab.nvim' })
        require('neotab').setup({})
    end,
    once = true
})
