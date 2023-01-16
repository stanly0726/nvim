vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- nord
    use 'shaunsingh/nord.nvim'

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- harpoon
    use('theprimeagen/harpoon')

    -- undotree
    use('mbbill/undotree')

    -- fugitive(git)
    use('tpope/vim-fugitive')

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- comment(gcc)
    use {
        'numToStr/Comment.nvim',
    }

    -- autopair(pair brackets)
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- fidget(lsp status)
    use 'j-hui/fidget.nvim'

    -- tabout
    use {
        'abecodes/tabout.nvim',
        wants = { 'nvim-treesitter' }, -- or require if not used so far
        after = { 'nvim-cmp' } -- if a completion plugin is using tabs load it before
    }

    -- icons
    use 'nvim-tree/nvim-web-devicons'

    -- jump everywhere
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require 'hop'.setup {
                create_hl_autocmd = false,
            }
        end
    }

    -- surround edit
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        'declancm/cinnamon.nvim',
        config = function() require('cinnamon').setup({
                default_delay = 7,
                extra_keymaps = true,
                hide_cursor = true,
                max_length = 200,
            })
        end
    }
end)
