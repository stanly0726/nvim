local bind = require('keymap.bind')

vim.pack.add({ 'https://github.com/Bekaboo/dropbar.nvim' })
local dropbar_api = require('dropbar.api')

bind.load_mapping({
  ['n|<Leader>;'] = bind.map_lua(dropbar_api.pick):with_desc('Dropbar: pick symbols'),
  ['n|[;'] = bind.map_lua(dropbar_api.goto_context_start):with_desc('Dropbar: goto context start'),
  ['n|];'] = bind.map_lua(dropbar_api.select_next_context):with_desc('Dropbar: next context'),
})
