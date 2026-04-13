vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' })

require('mini.icons').setup()
require('mini.files').setup( -- No need to copy this inside `setup()`. Will be used automatically.
  {
    mappings = {
      go_in = '<Right>',
      go_in_plus = '<CR>',
      go_out = '<Left>',
    },
    options = {
      permanent_delete = false,
    },
    windows = {
      preview = true,
    },
  }
)

vim.keymap.set('n', '-', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = 'Mini.File: open menu' })

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesWindowOpen',
  callback = function(args)
    local win_id = args.data.win_id

    -- Customize window-local settings
    vim.wo[win_id].winblend = 15
    local config = vim.api.nvim_win_get_config(win_id)
    -- config.border, config.title_pos = 'double', 'right'
    vim.api.nvim_win_set_config(win_id, config)
  end,
})

vim.api.nvim_create_autocmd('BufRead', {
  once = true,
  callback = function()
    local MiniAi = require('mini.ai')
    local MiniSurround = require('mini.surround')

    MiniAi.setup({
      custom_textobjects = {
        f = MiniAi.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
        F = MiniAi.gen_spec.function_call(),
      },
    })

    MiniSurround.setup({
      custom_surroundings = {
        -- Use tree-sitter to search for function call
        f = {
          input = MiniSurround.gen_spec.input.treesitter({
            outer = '@function.outer',
            inner = '@function.inner',
          }),
        },
        F = { input = { '%f[%w_%.][%w_%.]+%b()', '^.-%(().*()%)$' } },
      },
    })

    require('mini.pairs').setup({ modes = { command = true } })
  end,
})
