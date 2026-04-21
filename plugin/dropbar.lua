vim.pack.add({ 'https://github.com/Bekaboo/dropbar.nvim' })
local dropbar_api = require('dropbar.api')
vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Dropbar: pick symbols' })
vim.keymap.set(
  'n',
  '[;',
  dropbar_api.goto_context_start,
  { desc = 'Dropbar: goto context start' }
)
vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Dropbar: next context' })
