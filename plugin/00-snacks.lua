local bind = require('keymap.bind')

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

vim.schedule(function()
  bind.load_mapping({
    ['n|<leader>ff'] = bind.map_lua(Snacks.picker.files):with_desc('Snacks: files picker'),
    ['n|<leader>fb'] = bind.map_lua(Snacks.picker.buffers):with_desc('Snacks: buffers picker'),
    ['n|<leader>fr'] = bind.map_lua(Snacks.picker.registers):with_desc('Snacks: register picker'),
    ['n|<leader>sh'] = bind.map_lua(Snacks.picker.help):with_desc('Snacks: help picker'),
    ['n|<leader>sk'] = bind.map_lua(Snacks.picker.keymaps):with_desc('Snacks: keymaps picker'),
    ['n|<leader>sw'] = bind.map_lua(function()
      Snacks.picker.grep({ hidden = true })
    end):with_desc('Snacks: workspace grep'),
    ['n|<leader>sW'] = bind.map_lua(function()
      Snacks.picker.grep_word({ hidden = true })
    end):with_desc('Snacks: grep under cursor'),
    ['n|<leader>ss'] = bind.map_lua(function()
      Snacks.picker()
    end):with_desc('Snacks: picker menu'),
    ['n|<leader>sd'] = bind.map_lua(Snacks.picker.diagnostics):with_desc('Snacks: diagnostics picker'),
    ['n|<leader>e'] = bind.map_lua(function()
      Snacks.explorer()
    end):with_desc('Snacks: explorer'),
  })

-- toggle Snacks.nvim zen mode
  vim.api.nvim_create_user_command('Zen', Snacks.zen.zen, {
    desc = 'toggle Snacks.nvim zen mode',
  })
end)
