local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode

local mappings = {
  ['n|<S-Tab>'] = map_cr('normal za'):with_noremap():with_silent():with_desc('fold: toggle fold'),
  ['n|<C-s>'] = map_cu('write'):with_noremap():with_silent():with_desc('file: save'),
  ['n|J'] = map_cmd('mzJ`z'):with_noremap():with_desc('edit: join lines'),
  ['n|n'] = map_cmd('nzzzv'):with_noremap():with_desc('search: next match'),
  ['n|N'] = map_cmd('Nzzzv'):with_noremap():with_desc('search: prev match'),
  ['n|<C-f>'] = map_cr('!tmux neww ~/.local/bin/tmux-sessionizer<CR>')
    :with_silent()
    :with_desc('open tmux-sessionizer'),
  ['n|<leader>Y'] = map_cmd([["+Y]]):with_desc('yank: line to system clipboard'),
  ['n|<F2>'] = map_callback(function()
    vim.lsp.buf.rename()
  end):with_desc('edit: rename'),

  -- window movement
  ['n|<C-Left>'] = map_cmd('<C-w>h'):with_desc('window: focus left'),
  ['n|<C-Down>'] = map_cmd('<C-w>j'):with_desc('window: focus below'),
  ['n|<C-Up>'] = map_cmd('<C-w>k'):with_desc('window: focus above'),
  ['n|<C-Right>'] = map_cmd('<C-w>l'):with_desc('window: focus right'),
  ['n|<C-S-Left>'] = map_cmd('<C-w>H'):with_desc('window: move to far left'),
  ['n|<C-S-Down>'] = map_cmd('<C-w>J'):with_desc('window: move to bottom'),
  ['n|<C-S-Up>'] = map_cmd('<C-w>K'):with_desc('window: move to top'),
  ['n|<C-S-Right>'] = map_cmd('<C-w>L'):with_desc('window: move to far right'),

  ['n|<C-w>v'] = map_cr('vnew'):with_desc('window: split vertical'),

  -- homerow mapping for colemak
  ['n|<A-m>'] = map_cmd('h'):with_desc('nav: left'),
  ['n|<A-n>'] = map_cmd('j'):with_desc('nav: down'),
  ['n|<A-e>'] = map_cmd('k'):with_desc('nav: up'),
  ['n|<A-i>'] = map_cmd('l'):with_desc('nav: right'),

  -- for chipper keyboard
  ['n|<PageUp>'] = map_cmd('<C-u>'):with_desc('scroll: half page up'),
  ['n|<PageDown>'] = map_cmd('<C-d>'):with_desc('scroll: half page down'),

  ['n|<Home>'] = map_cmd('<cmd>cprev<CR>zz'):with_desc('quickfix: prev'),
  ['n|<End>'] = map_cmd('<cmd>cnext<CR>zz'):with_desc('quickfix: next'),
  ['n|<leader>k'] = map_cmd('<cmd>lprev<CR>zz'):with_desc('loclist: prev'),
  ['n|<leader>j'] = map_cmd('<cmd>lnext<CR>zz'):with_desc('loclist: next'),

  -- tab navigation
  ['n|<C-PageDown>'] = map_cr('tabnext'):with_desc('tab: next'),
  ['n|<C-PageUp>'] = map_cr('tabprevious'):with_desc('tab: prev'),

  -- Visual mode
  ['v|N'] = map_cmd(":m '>+1<CR>gv=gv"):with_desc('edit: move selection down'),
  ['v|E'] = map_cmd(":m '<-2<CR>gv=gv"):with_desc('edit: move selection up'),
  ['v|<leader>y'] = map_cmd([["+y]]):with_desc('yank: selection to system clipboard'),
  ['v|<leader>d'] = map_cmd([["_d]]):with_desc('edit: delete to black hole register'),
  ['x|<leader>p'] = map_cmd([["_dP"]]):with_desc('edit: paste without clobbering register'),
}

bind.nvim_load_mapping(mappings)
