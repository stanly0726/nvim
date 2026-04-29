vim.api.nvim_create_autocmd('BufRead', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/rmagatti/logger.nvim' })
    vim.pack.add({ 'https://github.com/rmagatti/goto-preview' })
    require('goto-preview').setup({
      default_mappings = true,
      opacity = 0,
      -- references = {
      --   provider = 'snacks',
      -- },
    })
  end,
})
