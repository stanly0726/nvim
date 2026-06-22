vim.pack.add({
  {
    src = 'https://github.com/nickjvandyke/opencode.nvim',
    version = vim.version.range('*'),
  },
})

---@type opencode.Opts
vim.g.opencode_opts = {
  -- Your configuration, if any; goto definition on the type or field for details
  server = {
    start = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local opencode = Terminal:new({
        cmd = 'opencode --port',
        id = 99,
        display_name = 'opencode',
        direction = 'vertical',
      })
      Terminal.open(opencode, 70, 'vertical')

      function _opencode_toggle()
        opencode:toggle()
      end
    end,
  },
}

vim.o.autoread = true -- Required for `opts.events.reload`

-- Recommended/example keymaps
vim.keymap.set({ 'n' }, '<leader>o', function()
  if _opencode_toggle == nil then
    require('opencode').start()
  else
    _opencode_toggle()
  end
end, { desc = 'Opencode: toggle UI' })
vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
  require('opencode').select()
end, { desc = 'Opencode: open menu' })
vim.keymap.set({ 'x' }, '<leader>o', function()
  require('opencode').ask('@this: ')
end, { desc = 'Opencode: ask selected' })

vim.keymap.set({ 'n', 'x' }, 'go', function()
  return require('opencode').operator('@this ')
end, { desc = 'Opencode: link range', expr = true })
