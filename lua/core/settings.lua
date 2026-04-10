local settings = {}

-- Leader Key
---@type string
settings['leader_key'] = ' '

-- Set it to false if there is no need to format on save.
---@type boolean
settings['format_on_save'] = true

-- Set it to false if you want to turn off LSP Inlay Hints
---@type boolean
settings['lsp_inlayhints'] = true

-- Set it to false if diagnostics virtual lines is annoying.
---@type boolean
settings['diagnostics_virtual_lines'] = false

-- Set it to one of the values below if you want to change the visible severity level of lsp diagnostics.
-- Priority: `Error` > `Warning` > `Information` > `Hint`.
--  > e.g. if you set this option to `Warning`, only lsp warnings and errors will be shown.
-- NOTE: This entry only works when `diagnostics_virtual_text` is true.
---@type "ERROR"|"WARN"|"INFO"|"HINT"
settings['diagnostics_level'] = 'HINT'

-- Set it to false if you don't use nvim to open big files.
---@type boolean
settings['load_big_files_faster'] = true

-- Set the colorscheme to use here.
-- Available values are: `catppuccin`, `catppuccin-latte`, `catppucin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato`.
---@type string
settings['colorscheme'] = 'everforest'

-- Set it to true if your terminal has transparent background.
---@type boolean
settings['transparent_background'] = false

-- Set background color to use here.
-- Useful if you would like to use a colorscheme that has a light and dark variant like `edge`.
-- Valid values are: `dark`, `light`.
---@type "dark"|"light"
settings['background'] = 'dark'

-- Set the language servers that will be installed during bootstrap here.
-- check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
---@type string[]
settings['lsp_deps'] = {
  'bashls',
  'clangd',
  'html',
  'jsonls',
  'lua_ls',
  'pylsp',
  'gopls',
}

-- Set the Debug Adapter Protocol (DAP) clients that will be installed and configured during bootstrap here.
-- Check the below link for all supported DAPs:
-- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
---@type string[]
settings['dap_deps'] = {
  'codelldb', -- C-Family
  'delve', -- Go
  'python', -- Python (debugpy)
}

-- Set the Treesitter parsers that will be installed during bootstrap here.
-- Check the below link for all supported languages:
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
---@type string[]
settings['treesitter_deps'] = {
  'bash',
  'c',
  'cpp',
  'css',
  'go',
  'gomod',
  'html',
  'java',
  'javascript',
  'json',
  'kotlin',
  'latex',
  'lua',
  'make',
  'markdown',
  'markdown_inline',
  'python',
  'regex',
  'rust',
  'typescript',
  'vimdoc',
  'vue',
  'yaml',
}

-- Set the options for neovim's gui clients like `neovide` and `neovim-qt` here.
-- NOTE: Currently, only the following options related to the GUI are supported. Other entries will be IGNORED.
---@type { font_name: string, font_size: number }
settings['gui_config'] = {
  font_name = 'Iosevka Term Extended',
  font_size = 18,
}

-- Set the options specific to `neovide` here.
-- NOTE: You should remove the `neovide_` prefix (with trailing underscore) from all your entries below.
-- Check the below link for all supported entries:
-- https://neovide.dev/configuration.html
---@type table<string, boolean|number|string>
settings['neovide_config'] = {
  input_macos_option_key_is_meta = 'only_left',
  -- no_idle = true,
  -- refresh_rate = 120,
  -- cursor_vfx_mode = "railgun",
  -- cursor_vfx_opacity = 200.0,
  -- cursor_antialiasing = true,
  -- cursor_trail_length = 0.05,
  -- cursor_animation_length = 0.03,
  -- cursor_vfx_particle_speed = 20.0,
  -- cursor_vfx_particle_density = 5.0,
  -- cursor_vfx_particle_lifetime = 1.2,
}

return settings
