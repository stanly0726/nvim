vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/rafamadriz/friendly-snippets' })
    vim.pack.add({
      { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
    })
    require('blink.cmp').setup({
      keymap = {
        preset = 'default',
        ['<C-e>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-p>'] = { 'cancel' },
      },
      completion = {
        menu = {
          draw = {
            columns = { { 'label' }, { 'kind_icon', 'kind', gap = 1 }, { 'source_name' } },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        ghost_text = { enabled = true },
        list = {
          selection = {
            auto_insert = false,
          },
        },
      },
    })
  end,
})
