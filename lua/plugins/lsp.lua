return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' }, -- Required
        {
            'hrsh7th/cmp-nvim-lsp',
            dependencies = {
                'hrsh7th/cmp-nvim-lsp-signature-help' -- for displaying signature
            }
        },                                            -- Required
        { 'L3MON4D3/LuaSnip' },                       -- Required
        { 'rafamadriz/friendly-snippets' },

        -- nvim_cmp_sources
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
    },
    config = function()
        local lsp = require('lsp-zero').preset({
            name = 'recommended',
            manage_nvim_cmp = {
                set_basic_mappings = false,
            }
        })
        local lspconfig = require('lspconfig')
        local cmp = require('cmp')
        local luasnip = require("luasnip")

        luasnip.config.set_config({
            region_check_events = 'InsertEnter',
            delete_check_events = 'InsertLeave'
        })

        -- set autopairs to work with cmp
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        require('luasnip.loaders.from_vscode').lazy_load()
        cmp.setup({
            sources = {
                { name = 'luasnip',                keyword_length = 2 },
                { name = 'nvim_lsp' },
                { name = "nvim_lua" },
                { name = 'path' },
                { name = 'buffer',                 keyword_length = 4 },
                { name = 'nvim_lsp_signature_help' }
            },
            mapping = {
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })

        lspconfig.intelephense.setup({
            settings = {
                intelephense = {
                    format = {
                        braces = "k&r",
                    }
                }
            }
        })

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })

        lspconfig.tsserver.setup({
            settings = {
                typescript = {
                    format = {
                        indentSize = 2,
                    }
                }
            }
        })

        lsp.ensure_installed({
            -- Replace these with whatever servers you want to install
            'rust_analyzer',
            'lua_ls',
            "tsserver",
            "tailwindcss",
            "cssls",
            "pylsp"
        })

        lsp.setup()
    end
}
