local bind = require('keymap.bind')
local map_raw = bind.map_raw
local map_cmd = bind.map_cmd
local map_cmd_norange = bind.map_cmd_norange
local map_lua = bind.map_lua

local mappings = {
  ['n|<S-Tab>'] = map_cmd('normal za'):with_silent():with_desc('fold: toggle fold'),
  ['n|<C-s>'] = map_cmd_norange('write'):with_silent():with_desc('file: save'),
  ['n|J'] = map_raw('mzJ`z'):with_desc('edit: join lines'),
  ['n|n'] = map_raw('nzzzv'):with_desc('search: next match'),
  ['n|N'] = map_raw('Nzzzv'):with_desc('search: prev match'),
  ['n|<C-f>'] = map_cmd('!tmux neww ~/.local/bin/tmux-sessionizer<CR>')
    :with_silent()
    :with_desc('open tmux-sessionizer'),
  ['n|<leader>Y'] = map_raw([["+Y]]):with_desc('yank: line to system clipboard'),
  ['n|<F2>'] = map_lua(function()
    vim.lsp.buf.rename()
  end):with_desc('edit: rename'),

  -- window movement
  ['n|<C-Left>'] = map_raw('<C-w>h'):with_desc('window: focus left'),
  ['n|<C-Down>'] = map_raw('<C-w>j'):with_desc('window: focus below'),
  ['n|<C-Up>'] = map_raw('<C-w>k'):with_desc('window: focus above'),
  ['n|<C-Right>'] = map_raw('<C-w>l'):with_desc('window: focus right'),
  ['n|<C-S-Left>'] = map_raw('<C-w>H'):with_desc('window: move to far left'),
  ['n|<C-S-Down>'] = map_raw('<C-w>J'):with_desc('window: move to bottom'),
  ['n|<C-S-Up>'] = map_raw('<C-w>K'):with_desc('window: move to top'),
  ['n|<C-S-Right>'] = map_raw('<C-w>L'):with_desc('window: move to far right'),

  ['n|<C-w>v'] = map_cmd('vnew'):with_desc('window: split vertical'),

  -- homerow mapping for colemak
  ['n|<A-m>'] = map_raw('h'):with_desc('nav: left'),
  ['n|<A-n>'] = map_raw('j'):with_desc('nav: down'),
  ['n|<A-e>'] = map_raw('k'):with_desc('nav: up'),
  ['n|<A-i>'] = map_raw('l'):with_desc('nav: right'),

  -- for chipper keyboard
  ['n|<PageUp>'] = map_raw('<C-u>'):with_desc('scroll: half page up'),
  ['n|<PageDown>'] = map_raw('<C-d>'):with_desc('scroll: half page down'),

  ['n|<Home>'] = map_raw('<cmd>cprev<CR>zz'):with_desc('quickfix: prev'),
  ['n|<End>'] = map_raw('<cmd>cnext<CR>zz'):with_desc('quickfix: next'),
  ['n|<leader>k'] = map_raw('<cmd>lprev<CR>zz'):with_desc('loclist: prev'),
  ['n|<leader>j'] = map_raw('<cmd>lnext<CR>zz'):with_desc('loclist: next'),

  -- tab navigation
  ['n|<C-PageDown>'] = map_cmd('tabnext'):with_desc('tab: next'),
  ['n|<C-PageUp>'] = map_cmd('tabprevious'):with_desc('tab: prev'),

  -- Visual mode
  ['v|N'] = map_raw(":m '>+1<CR>gv=gv"):with_desc('edit: move selection down'),
  ['v|E'] = map_raw(":m '<-2<CR>gv=gv"):with_desc('edit: move selection up'),
  ['v|<leader>y'] = map_raw([["+y]]):with_desc('yank: selection to system clipboard'),
  ['v|<leader>d'] = map_raw([["_d]]):with_desc('edit: delete to black hole register'),
  ['x|<leader>p'] = map_raw([["_dP"]]):with_desc('edit: paste without clobbering register'),
}

bind.load_mapping(mappings)
