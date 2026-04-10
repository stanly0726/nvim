local bind = require('keymap.bind')
local map_cmd = bind.map_cmd

local mappings = {
  ['t|<esc>'] = map_cmd([[<C-\><C-n>]])
    :with_noremap()
    :with_buffer(0)
    :with_desc('ToggleTerm: normal mode'),

  ['t|<C-Left>'] = map_cmd([[<Cmd>wincmd h<CR>]])
    :with_noremap()
    :with_buffer(0)
    :with_desc('ToggleTerm: move to window left'),

  ['t|<C-Down>'] = map_cmd([[<Cmd>wincmd j<CR>]])
    :with_noremap()
    :with_buffer(0)
    :with_desc('ToggleTerm: move to window below'),

  ['t|<C-Up>'] = map_cmd([[<Cmd>wincmd k<CR>]])
    :with_noremap()
    :with_buffer(0)
    :with_desc('ToggleTerm: move to window above'),

  ['t|<C-Right>'] = map_cmd([[<Cmd>wincmd l<CR>]])
    :with_noremap()
    :with_buffer(0)
    :with_desc('ToggleTerm: move to window right'),
}

_G.set_terminal_keymaps = function()
  bind.nvim_load_mapping(mappings)
end
