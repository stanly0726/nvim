vim.schedule(function()
  vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })

  require('gitsigns').setup({ current_line_blame = true })

  vim.keymap.set('n', '<leader>gp', ':Gitsign preview_hunk<CR>', { desc = 'Gitsign: preview hunk' })
  vim.keymap.set(
    { 'n', 'x' },
    '<leader>gs',
    ':Gitsign stage_hunk<CR>',
    { desc = 'Gitsign: stage hunk' }
  )
  vim.keymap.set('n', '<leader>gd', ':Gitsign reset_hunk<CR>', { desc = 'Gitsign: reset hunk' })
  vim.keymap.set('n', ']g', ':Gitsign next_hunk<CR>', { desc = 'Gitsign: next hunk' })
  vim.keymap.set('n', '[g', ':Gitsign prev_hunk<CR>', { desc = 'Gitsign: previous hunk' })
end)
