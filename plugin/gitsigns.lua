local bind = require('keymap.bind')

vim.schedule(function()
  vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })

  require('gitsigns').setup({ current_line_blame = true })

  bind.load_mapping({
    ['n|<leader>gp'] = bind.map_cmd('Gitsign preview_hunk'):with_desc('Gitsign: preview hunk'),
    ['nx|<leader>gs'] = bind.map_cmd('Gitsign stage_hunk'):with_desc('Gitsign: stage hunk'),
    ['n|<leader>gd'] = bind.map_cmd('Gitsign reset_hunk'):with_desc('Gitsign: reset hunk'),
    ['n|]g'] = bind.map_cmd('Gitsign next_hunk'):with_desc('Gitsign: next hunk'),
    ['n|[g'] = bind.map_cmd('Gitsign prev_hunk'):with_desc('Gitsign: previous hunk'),
  })
end)
