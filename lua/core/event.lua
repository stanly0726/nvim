local settings = require('core.settings')
local autocmd = {}

-- Autoclose some filetype with <q>
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'qf',
    'help',
    'man',
    'oil',
    'git',
    'notify',
    'nofile',
    'lspinfo',
    'terminal',
    'prompt',
    'toggleterm',
    'copilot',
    'startuptime',
    'tsplayground',
    'PlenaryTestPopup',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.api.nvim_buf_set_keymap(event.buf, 'n', 'q', '<Cmd>close<CR>', { silent = true })
  end,
})

-- Start treesitter for installed parsers
vim.api.nvim_create_autocmd('FileType', {
  pattern = settings.treesitter_deps,
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})

-- Autojump to last edit
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- auto cd into path argument
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Change directory to the path argument passed on startup',
  callback = function()
    -- Get the first argument passed to nvim
    local arg = vim.fn.argv(0)
    if arg == '' then
      return
    end

    -- Check if it is a directory or a file, and find its parent folder
    local path = vim.fn.expand(arg)
    if vim.fn.isdirectory(path) == 0 then
      path = vim.fn.fnamemodify(path, ':h')
    end

    -- Change the global working directory
    vim.cmd('cd ' .. vim.fn.fnameescape(path))
  end,
})

function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    -- Prepend an underscore to avoid name clashes
    vim.api.nvim_command('augroup _' .. group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.iter({ 'autocmd', def }):flatten(math.huge):totable(), ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

function autocmd.load_autocmds()
  local definitions = {
    bufs = {
      { 'BufWritePre', '*~', 'setlocal noundofile' },
      { 'BufWritePre', '/tmp/*', 'setlocal noundofile' },
      { 'BufWritePre', '*.tmp', 'setlocal noundofile' },
      { 'BufWritePre', '*.bak', 'setlocal noundofile' },
      { 'BufWritePre', 'MERGE_MSG', 'setlocal noundofile' },
      { 'BufWritePre', 'description', 'setlocal noundofile' },
      { 'BufWritePre', 'COMMIT_EDITMSG', 'setlocal noundofile' },
    },
    wins = {
      -- Highlight current line only on focused window
      {
        'WinEnter,BufEnter,InsertLeave',
        '*',
        [[if ! &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal cursorline | endif]],
      },
      {
        'WinLeave,BufLeave,InsertEnter',
        '*',
        [[if &cursorline && &filetype !~# '^\(dashboard\|clap_\)' && ! &pvw | setlocal nocursorline | endif]],
      },
      -- Attempt to write shada when leaving nvim
      {
        'VimLeave',
        '*',
        [[if has('nvim') | wshada | else | wviminfo! | endif]],
      },
      -- Check if file changed when its window is focus, more eager than 'autoread'
      { 'FocusGained', '*', 'checktime' },
      -- Maintain uniform window dimensions when resizing Vim windows
      { 'VimResized', '*', [[tabdo wincmd =]] },
    },
    ft = {
      { 'FileType', '*', 'setlocal formatoptions-=cro' },
      { 'FileType', 'alpha', 'setlocal showtabline=0' },
      { 'FileType', 'markdown', 'setlocal wrap' },
      { 'FileType', 'dap-repl', "lua require('dap.ext.autocompl').attach()" },
    },
    yank = {
      {
        'TextYankPost',
        '*',
        [[silent! lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 })]],
      },
    },
    term = {
      { 'TermOpen', 'term://*toggleterm#*', 'lua set_terminal_keymaps()' },
    },
  }
  autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
