vim.schedule(function()
  vim.pack.add({
    { src = 'https://github.com/akinsho/toggleterm.nvim', version = vim.version.range('*') },
  })
  require('toggleterm').setup({
    open_mapping = [[<c-\>]],
  })
end)
