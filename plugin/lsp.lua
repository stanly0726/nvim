vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
}, {
  load = function()
    vim.api.nvim_create_autocmd('BufRead', {
      callback = function()
        vim.cmd.packadd('nvim-lspconfig')
        vim.cmd.packadd('mason.nvim')
        vim.cmd.packadd('mason-lspconfig.nvim')

        require('mason').setup()
        local settings = require('core.settings')

        local diagnostics_virtual_lines = settings.diagnostics_virtual_lines
        local diagnostics_level = settings.diagnostics_level
        local inlay_hint = settings.lsp_inlayhints

        require('mason-lspconfig').setup({
          ensure_installed = settings.lsp_deps,
        })

        vim.diagnostic.config({
          signs = true,
          virtual_text = not diagnostics_virtual_lines,
          virtual_lines = diagnostics_virtual_lines and {
            severity = {
              min = vim.diagnostic.severity[diagnostics_level],
            },
          } or false,
        })
        vim.lsp.inlay_hint.enable(inlay_hint)
      end,
      once = true,
    })
  end,
})
