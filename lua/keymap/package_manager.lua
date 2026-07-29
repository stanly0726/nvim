local bind = require('keymap.bind')
local map_lua = bind.map_lua

local mappings = {
  ['n|<leader>pu'] = map_lua(vim.pack.update):with_desc('package: Update'),
  ['n|<leader>pp'] = map_lua(function()
    vim.pack.update(nil, { offline = true })
  end):with_desc('package: List'),
  ['n|<leader>pr'] = map_lua(function()
    vim.pack.update(nil, { target = 'lockfile' })
  end):with_desc('package: Restore'),
}

bind.load_mapping(mappings)
