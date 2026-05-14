vim.api.nvim_create_autocmd('BufRead', {
  once = true,
  callback = function()
    vim.pack.add({
      'https://github.com/mfussenegger/nvim-dap',
      'https://github.com/nvim-neotest/nvim-nio',
      'https://github.com/rcarriga/nvim-dap-ui',
      'https://github.com/jay-babu/mason-nvim-dap.nvim',
      'https://github.com/theHamsta/nvim-dap-virtual-text',
    })

    local mason_dap = require('mason-nvim-dap')
    local dap = require('dap')
    local dapui = require('dapui')
    local dap_virtual_text = require('nvim-dap-virtual-text')

    dap_virtual_text.setup({})
    dapui.setup()
    mason_dap.setup({
      ensure_installed = require('core.settings')['dap_deps'],
      automatic_installation = true,
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      },
    })

    dap.configurations.python = {
      {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = 'Launch file',

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = '${file}', -- This configuration will launch the current file if used.
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python3'
          end
        end,
      },
    }

    vim.keymap.set('n', '<leader>du', function()
      dapui.toggle({})
    end, { desc = 'DapUI: toggle' })
  end,
})
