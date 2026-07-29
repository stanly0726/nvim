local settings = require('core.settings')

vim.pack.add({ 'https://github.com/neanias/everforest-nvim' })

vim.schedule(function()
  require('everforest').setup({
    italics = true,
    transparent_background_level = settings['transparent_background'] and 1 or 0,
    background = 'medium',
  })
  vim.cmd.colorscheme('everforest')
end)
