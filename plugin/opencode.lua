local bind = require('keymap.bind')

vim.pack.add({
  {
    src = 'https://github.com/nickjvandyke/opencode.nvim',
    version = vim.version.range('*'),
  },
})

---@type opencode.Opts
vim.g.opencode_opts = {
  -- Your configuration, if any; goto definition on the type or field for details
  server = {
    start = function()
      local Terminal = require('toggleterm.terminal').Terminal
      Opencode = Terminal:new({
        cmd = 'opencode --port',
        id = 99,
        display_name = 'opencode',
        direction = 'vertical',
      })

      Opencode:open(60, 'vertical')
    end,
  },
}

vim.o.autoread = true -- Required for `opts.events.reload`

-- Recommended/example keymaps
bind.load_mapping({
  ['n|<leader>o'] = bind
    .map_lua(function()
      if Opencode == nil then
        require('opencode.config').opts.server.start()
      else
        Opencode:toggle()
      end
    end)
    :with_desc('Opencode: toggle UI'),
  ['nx|<C-x>'] = bind
    .map_lua(function()
      require('opencode').select()
    end)
    :with_desc('Opencode: open menu'),
  ['x|<leader>o'] = bind
    .map_lua(function()
      require('opencode').ask('@this: ')
    end)
    :with_desc('Opencode: ask selected'),
  ['nx|go'] = bind
    .map_lua(function()
      return require('opencode').operator('@this ')
    end)
    :with_desc('Opencode: link range')
    :with_expr(),
})
