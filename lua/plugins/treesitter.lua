local settings = require("core.settings")

---@module "lazy"
---@type LazySpec
return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter").install(settings.treesitter_deps)
    end
}
