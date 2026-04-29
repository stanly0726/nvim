vim.pack.add({ 'https://github.com/folke/snacks.nvim' })
require('snacks').setup({
  input = {},
  picker = {
    sources = {
      git_log = {
        confirm = function(picker, item)
          picker:close()
          require('gitsigns').show_commit(item.commit)
        end,
      },
    },
  },
  indent = {
    animate = {
      enabled = false,
    },
  },
  scroll = not vim.g.neovide and {
    animate = {
      easing = 'inOutSine',
    },
  } or nil,
  statuscolumn = {
    folds = {
      git_hl = true,
      open = true,
    },
  },
})

vim.keymap.set('n', '<leader>ff', Snacks.picker.files, { desc = 'Snacks: files picker' })
vim.keymap.set('n', '<leader>fb', Snacks.picker.buffers, { desc = 'Snacks: buffers picker' })

vim.keymap.set('n', '<leader>sh', Snacks.picker.help, { desc = 'Snacks: help picker' })
vim.keymap.set('n', '<leader>sk', Snacks.picker.keymaps, { desc = 'Snacks: keymaps picker' })
vim.keymap.set('n', '<leader>sw', function()
  Snacks.picker.grep({ hidden = true })
end, { desc = 'Snacks: workspace grep' })
vim.keymap.set('n', '<leader>sW', function()
  Snacks.picker.grep_word({ hidden = true })
end, { desc = 'Snacks: grep under cursor' })

vim.keymap.set('n', '<leader>ss', function()
  Snacks.picker()
end, { desc = 'Snacks: picker menu' })
vim.keymap.set(
  'n',
  '<leader>sd',
  Snacks.picker.diagnostics,
  { desc = 'Snacks: diagnostics picker' }
)
vim.keymap.set('n', '<leader>e', function()
  Snacks.explorer()
end, { desc = 'Snacks: explorer' })

-- toggle Snacks.nvim zen mode
vim.api.nvim_create_user_command('Zen', Snacks.zen.zen, {
  desc = 'toggle Snacks.nvim zen mode',
})
