vim.schedule(function()
  vim.pack.add({
    'https://github.com/tpope/vim-repeat',
    'https://codeberg.org/andyg/leap.nvim.git',
  })

  vim.keymap.set({ 'n', 'x', 'o' }, ',', '<Plug>(leap)', { desc = 'Leap: jump to word' })
  -- vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', {desc = "leap search backward"})
  vim.keymap.set(
    { 'n', 'x', 'o' },
    '<leader>,',
    '<Plug>(leap-from-window)',
    { desc = 'Leap: jump across windows' }
  )
end)
