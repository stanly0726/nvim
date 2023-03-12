local global = require('core.global')

local map_leader = function()
    vim.g.mapleader = " "
    vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
    vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local clipboard_config = function()
    if global.is_mac then
        vim.g.clipboard = {
            name = "macOS-clipboard",
            copy = { ["+"] = "pbcopy",["*"] = "pbcopy" },
            paste = { ["+"] = "pbpaste",["*"] = "pbpaste" },
            cache_enabled = 0,
        }
    elseif global.is_wsl then
        vim.g.clipboard = {
            name = 'WslClipboard',
            copy = {
                    ['+'] = 'clip.exe',
                    ['*'] = 'clip.exe',
            },
            paste = {
                    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            },
            cache_enabled = 0,
        }
    end
end

local load_core = function()
    map_leader()

    clipboard_config()

    require("core.options")
    require("core.mapping")
    -- require("keymap")
    require("core.event")
    require("core.lazy")

    local colorscheme = require("core.setting").colorscheme
    local background = require("core.setting").background
    vim.api.nvim_command("set background=" .. background)
    vim.api.nvim_command("colorscheme " .. colorscheme)
end

load_core()
