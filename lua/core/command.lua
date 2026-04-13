-- command to show which lsp server attaches to current buffer
vim.api.nvim_create_user_command('LspInfo', 'checkhealth vim.lsp', {
  desc = 'lsp information',
})

