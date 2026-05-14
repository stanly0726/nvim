vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.pack.add({ 'https://github.com/iamcco/markdown-preview.nvim' })

    vim.api.nvim_create_autocmd('PackChanged', {
      callback = function(event)
        local name, kind = event.data.spec.name, event.data.kind
        if name == 'markdown-preview' and kind == 'update' then
          if not event.data.active then
            vim.cmd.packadd('markdown-preview')
          end
          vim.fn['mkdp#util#install']()
        end
      end,
      desc = 'markdown-preview update hook',
    })
  end,
})
