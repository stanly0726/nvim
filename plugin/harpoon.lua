local bind = require('keymap.bind')

vim.schedule(function()
  vim.pack.add({ 'https://github.com/nvim-lua/plenary.nvim' })
  vim.pack.add({ { src = 'https://github.com/theprimeagen/harpoon', version = 'harpoon2' } })

  local harpoon = require('harpoon'):setup()

  bind.load_mapping({
    ['n|<leader>a'] = bind
      .map_lua(function()
        harpoon:list():add()
      end)
      :with_desc('Harpoon: add file'),
    ['n|<C-j>'] = bind
      .map_lua(function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      :with_desc('Harpoon: toggle menu'),
    ['n|<C-n>'] = bind
      .map_lua(function()
        harpoon:list():select(1)
      end)
      :with_desc('Harpoon: select 1st file'),
    ['n|<C-e>'] = bind
      .map_lua(function()
        harpoon:list():select(2)
      end)
      :with_desc('Harpoon: select 2nd file'),
  })
end)
