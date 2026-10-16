local settings = require('core.settings')

vim.pack.add({ 'https://github.com/sainnhe/everforest' })

vim.g.everforest_enable_italic = 1
vim.g.everforest_transparent_background = settings['transparent_background'] and 1 or 0
vim.g.everforest_better_performance = 1
vim.g.everforest_background = 'hard'

vim.cmd.colorscheme('everforest')
