vim.api.nvim_create_autocmd('BufRead', {
  once = true,
  callback = function()
    vim.pack.add({
      'https://github.com/neovim/nvim-lspconfig',
      'https://github.com/mason-org/mason-lspconfig.nvim',
    })

    local settings = require('core.settings')

    local diagnostics_virtual_lines = settings.diagnostics_virtual_lines
    local diagnostics_level = settings.diagnostics_level
    local inlay_hint = settings.lsp_inlayhints

    require('mason-lspconfig').setup({
      ensure_installed = settings.lsp_deps,
    })

    local icons = {
      diagnostics = require('core.utils.icons').get('diagnostics', true),
    }
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error_alt,
          [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning_alt,
          [vim.diagnostic.severity.INFO] = icons.diagnostics.Information_alt,
          [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint_alt,
        },
      },
      virtual_text = not diagnostics_virtual_lines,
      virtual_lines = diagnostics_virtual_lines and {
        severity = {
          min = vim.diagnostic.severity[diagnostics_level],
        },
      } or false,
    })
    vim.lsp.inlay_hint.enable(inlay_hint)
  end,
})
