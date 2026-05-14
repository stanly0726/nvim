vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/kawre/neotab.nvim' })
    require('neotab').setup({})
  end,
})
