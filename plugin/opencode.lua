vim.pack.add({
  {
    src = 'https://github.com/nickjvandyke/opencode.nvim',
    version = vim.version.range('*'),
  },
})

---@type opencode.Opts
vim.g.opencodedopts = {
  -- Your configuration, if any; goto definition on the type or field for details
}

vim.o.autoread = true -- Required for `opts.events.reload`

-- Recommended/example keymaps
vim.keymap.set({ 'n' }, '<leader>o', function()
  require('opencode').toggle()
end, { desc = 'Opencode: toggle UI' })
vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
  require('opencode').select()
end, { desc = 'Opencode: open menu' })
vim.keymap.set({ 'x' }, '<leader>o', function()
  require('opencode').ask('@this: ', { submit = true })
end, { desc = 'Opencode: ask selected' })

vim.keymap.set({ 'n', 'x' }, 'go', function()
  return require('opencode').operator('@this ')
end, { desc = 'Opencode: link range', expr = true })
