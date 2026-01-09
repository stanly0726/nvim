---@module "lazy"
---@type LazySpec
return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        require('mini.icons').setup()
        require('mini.ai').setup()
        require('mini.surround').setup()
        require('mini.pairs').setup({ modes = { command = true } })
    end
}
