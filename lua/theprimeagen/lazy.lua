local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- nord
    'shaunsingh/nord.nvim',

    -- treesitter
    { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },

    -- harpoon
    'theprimeagen/harpoon',

    -- undotree
    'mbbill/undotree',

    -- fugitive(git)
    'tpope/vim-fugitive',

    -- lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        lazy = false,
        priority = 1000, -- set to highest priority, forcing to load it first
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                dependencies = {
                    -- tabout
                    'abecodes/tabout.nvim',
                }
            },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        -- dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    -- comment(gcc)
    'numToStr/Comment.nvim',
    -- autopair(pair brackets)
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    -- fidget(lsp status)
    'j-hui/fidget.nvim',
    -- icons
    'nvim-tree/nvim-web-devicons',
    -- jump everywhere
    {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require 'hop'.setup {
                create_hl_autocmd = false,
            }
        end
    },
    -- surround edit
    {
        "kylechui/nvim-surround",
        -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- smooth movement
    {
        'declancm/cinnamon.nvim',
        config = function()
            require('cinnamon').setup({
                default_delay = 7,
                extra_keymaps = true,
                hide_cursor = true,
                max_length = 200,
            })
        end
    },
    -- syntax highlight for laravel blade
    'jwalton512/vim-blade',
    -- hookup non-lsp sources
    "jose-elias-alvarez/null-ls.nvim",
})
