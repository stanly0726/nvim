vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  once = true,
  callback = function()
    vim.pack.add({
      {
        src = 'https://github.com/JavaHello/spring-boot.nvim',
        version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
      },
      'https://github.com/MunifTanjim/nui.nvim',
      'https://github.com/mfussenegger/nvim-dap',
      'https://github.com/nvim-java/nvim-java',
    })

    require('java').setup({
      -- java_debug_adapter = { enable = false },
    })
    vim.lsp.enable('jdtls')

    vim.api.nvim_create_user_command('CleanJdtls', function()
      vim.fn.delete(vim.fn.expand('~/.cache/nvim/jdtls'), 'rf')
      vim.fn.delete(vim.fn.expand('~/.cache/jdtls'), 'rf')
      vim.fn.delete(vim.fn.expand('~/.local/share/jdtls'), 'rf')
      print('Deleted cache!')
    end, {})
  end,
})
