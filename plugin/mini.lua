vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' })

vim.schedule(function()
  require('mini.icons').setup()

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
end)
