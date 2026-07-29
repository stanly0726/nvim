local bind = require('keymap.bind')
local map_raw = bind.map_raw

local mappings = {
  ['t|<esc>'] = map_raw([[<C-\><C-n>]]):with_buffer(0):with_desc('ToggleTerm: normal mode'),

  ['t|<C-Left>'] = map_raw([[<Cmd>wincmd h<CR>]])
    :with_buffer(0)
    :with_desc('ToggleTerm: move to window left'),

  ['t|<C-Down>'] = map_raw([[<Cmd>wincmd j<CR>]])
    :with_buffer(0)
    :with_desc('ToggleTerm: move to window below'),

  ['t|<C-Up>'] = map_raw([[<Cmd>wincmd k<CR>]])
    :with_buffer(0)
    :with_desc('ToggleTerm: move to window above'),

  ['t|<C-Right>'] = map_raw([[<Cmd>wincmd l<CR>]])
    :with_buffer(0)
    :with_desc('ToggleTerm: move to window right'),
}

_G.set_terminal_keymaps = function()
  bind.load_mapping(mappings)
end
