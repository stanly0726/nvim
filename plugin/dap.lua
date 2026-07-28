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
    local icons = {
      ui = require('core.utils.icons').get('ui'),
      dap = require('core.utils.icons').get('dap'),
    }

    dap_virtual_text.setup({})
    ---@diagnostic disable-next-line: missing-fields
    dapui.setup({
      icons = {
        expanded = icons.ui.ArrowOpen,
        collapsed = icons.ui.ArrowClosed,
        current_frame = icons.ui.Indicator,
      },
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.3,
            },
            { id = 'watches', size = 0.3 },
            { id = 'stacks', size = 0.3 },
            { id = 'breakpoints', size = 0.1 },
          },
          size = 0.3,
          position = 'left',
        },
        {
          elements = {
            { id = 'console', size = 0.55 },
            { id = 'repl', size = 0.45 },
          },
          position = 'bottom',
          size = 0.25,
        },
      },
      controls = {
        enabled = true,
        -- Display controls in this session
        element = 'repl',
        icons = {
          pause = icons.dap.Pause,
          play = icons.dap.Play,
          step_into = icons.dap.StepInto,
          step_over = icons.dap.StepOver,
          step_out = icons.dap.StepOut,
          step_back = icons.dap.StepBack,
          run_last = icons.dap.RunLast,
          terminate = icons.dap.Terminate,
        },
      },
    })

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

    vim.fn.sign_define(
      'DapBreakpoint',
      { text = icons.dap.Breakpoint, texthl = 'DapBreakpoint', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
      'DapBreakpointCondition',
      { text = icons.dap.BreakpointCondition, texthl = 'DapBreakpoint', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
      'DapStopped',
      { text = icons.dap.Stopped, texthl = 'DapStopped', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
      'DapBreakpointRejected',
      { text = icons.dap.BreakpointRejected, texthl = 'DapBreakpoint', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
      'DapLogPoint',
      { text = icons.dap.LogPoint, texthl = 'DapLogPoint', linehl = '', numhl = '' }
    )
  end,
})
