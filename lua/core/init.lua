local settings = require('core.settings')
local global = require('core.global')

local leader_map = function()
  vim.g.mapleader = settings['leader_key']
end

-- auto cd into path argument
local change_dir = function()
  -- Get the first argument passed to nvim
  local arg = vim.fn.argv(0)
  if arg == '' then
    return
  end

  -- Check if it is a directory or a file, and find its parent folder
  local path = vim.fn.expand(arg)
  if vim.fn.isdirectory(path) == 0 then
    path = vim.fn.fnamemodify(path, ':h')
  end

  print(arg)
  -- Change the global working directory
  vim.cmd('cd ' .. vim.fn.fnameescape(path))
end

local gui_config = function()
  if next(settings.gui_config) then
    vim.api.nvim_set_option_value(
      'guifont',
      settings.gui_config.font_name .. ':h' .. settings.gui_config.font_size,
      {}
    )
  end
end

local neovide_config = function()
  for name, config in pairs(settings.neovide_config) do
    vim.g['neovide_' .. name] = config
  end
end

local clipboard_config = function()
  if global.is_mac then
    vim.g.clipboard = {
      name = 'macOS-clipboard',
      copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
      paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
      cache_enabled = 0,
    }
  elseif global.is_wsl then
    vim.g.clipboard = {
      name = 'win32yank-wsl',
      copy = {
        ['+'] = 'win32yank.exe -i --crlf',
        ['*'] = 'win32yank.exe -i --crlf',
      },
      paste = {
        ['+'] = 'win32yank.exe -o --lf',
        ['*'] = 'win32yank.exe -o --lf',
      },
      cache_enabled = 0,
    }
  end
end

local load_core = function()
  leader_map()
  change_dir()

  gui_config()
  neovide_config()
  clipboard_config()

  require('core.options')
  require('core.event')
  require('core.command')
  require('core.filetype')
  require('keymap')

  vim.api.nvim_set_option_value('background', settings.background, {})
  -- vim.cmd.colorscheme(settings.colorscheme)
end

load_core()
