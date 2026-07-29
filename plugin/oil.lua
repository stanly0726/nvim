vim.api.nvim_create_autocmd('BufRead', {
  once = true,
  callback = function()
    vim.pack.add({
      'https://github.com/nvim-mini/mini.nvim',
      'https://github.com/stevearc/oil.nvim',
    })

    require('oil').setup({
      default_file_explorer = false,
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 0.6,
      },
      keymaps = {
        ['<C-s>'] = false,
        ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
        ['gd'] = {
          desc = 'Toggle file detail view',
          callback = function()
            Oil_detail = not Oil_detail
            if Oil_detail then
              require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
            else
              require('oil').set_columns({ 'icon' })
            end
          end,
        },
      },
    })

    vim.keymap.set('n', '-', '<cmd>Oil --float<cr>', { desc = 'Oil: open oil menu' })
  end,
})
