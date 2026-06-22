local global = require('core.global')

local function load_options()
  local options = {
    autoread = true,
    breakat = [[\ \	;:,!?@*-+/]],
    cmdheight = 0,
    cmdwinheight = 5,
    complete = '.,w,b,k,kspell',
    completeopt = 'fuzzy,menuone,noselect,popup',
    cursorcolumn = true,
    cursorline = true,
    diffopt = 'filler,iwhite,internal,linematch:60,algorithm:patience',
    equalalways = false,
    errorbells = true,
    expandtab = true,
    foldexpr = 'v:lua.vim.treesitter.foldexpr()',
    foldlevelstart = 99,
    foldmethod = 'expr',
    helpheight = 12,
    history = 2000,
    hlsearch = false,
    ignorecase = true,
    jumpoptions = 'stack,view',
    laststatus = 3,
    linebreak = true,
    list = true,
    listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←',
    number = true,
    relativenumber = true,
    scrolloff = 8,
    sessionoptions = 'buffers,curdir,folds,help,tabpages,winpos,winsize',
    shada = "!,'500,<50,@100,s10,h",
    shiftround = true,
    shiftwidth = 4,
    shortmess = 'aoOTcF',
    showbreak = '↳  ',
    showmode = false,
    sidescrolloff = 10,
    signcolumn = 'yes',
    smartcase = true,
    smoothscroll = true,
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    switchbuf = 'usetab,uselast',
    tabstop = 4,
    termguicolors = true,
    timeoutlen = 500,
    undofile = true,
    -- Please do NOT set `updatetime` to above 500, otherwise most plugins may not function correctly
    updatetime = 200,
    virtualedit = 'block',
    visualbell = true,
    winborder = 'rounded',
    winminwidth = 10,
    wrap = false,
  }

  local function isempty(s)
    return s == nil or s == ''
  end
  local function use_if_defined(val, fallback)
    return val ~= nil and val or fallback
  end

  -- custom python provider
  local conda_prefix = vim.env.CONDA_PREFIX
  if not isempty(conda_prefix) then
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. '/bin/python')
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. '/bin/python')
  end

  for name, value in pairs(options) do
    vim.api.nvim_set_option_value(name, value, {})
  end
end

-- Newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.netrw_liststyle = 3

require('vim._core.ui2').enable()

load_options()
