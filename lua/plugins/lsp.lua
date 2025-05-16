return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
        config = false,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                    config = function()
                        require('luasnip.loaders.from_vscode').lazy_load()
                    end
                },
            },
            -- nvim_cmp_sources
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            local cmp = require('cmp')
            local luasnip = require("luasnip")
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')

            luasnip.config.set_config({
                region_check_events = 'InsertEnter',
                delete_check_events = 'InsertLeave'
             })
            -- set autopairs to work with cmp
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )

            cmp.setup({
                formatting = lsp_zero.cmp_format(),
                sources = {
                    { name = 'luasnip',                keyword_length = 2 },
                    { name = 'nvim_lsp' },
                    { name = "nvim_lua" },
                    { name = 'path' },
                    { name = 'buffer',                 keyword_length = 4 },
                    { name = 'nvim_lsp_signature_help' }
                },
                mapping = {
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-f>'] = lsp_zero.cmp_action().vim_snippet_jump_forward(),
                    ['<C-p>'] = cmp.mapping.abort(),
                    -- ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                    -- ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                    ['<C-e>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = 'select' })
                        else
                            cmp.complete()
                        end
                    end),
                    ['<C-n>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = 'select' })
                        else
                            cmp.complete()
                        end
                    end),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                experimental = {
                    ghost_text = true,
                },
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            local lsp_attach = function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end

            lsp_zero.extend_lspconfig({
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                lsp_attach = lsp_attach,
                sign_text = false,
            })

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'rust_analyzer',
                    'lua_ls',
                    "ts_ls",
                    "tailwindcss",
                    "cssls",
                    "pylsp"
                },
                handlers = {
                    function(server_name)
                        vim.lsp.inlay_hint.enable()
                        -- vim.diagnostic.config({ virtual_text = true })
                        require('lspconfig')[server_name].setup({})
                    end,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        require('lspconfig').lua_ls.setup({
                            on_init = function(client)
                                lsp_zero.nvim_lua_settings(client, {})
                            end,
                        })
                    end,
                    intelephense = function()
                        require('lspconfig').intelephense.setup({
                            settings = {
                                intelephense = {
                                    format = {
                                        braces = "k&r",
                                    }
                                }
                            }
                        })
                    end,
                    ts_ls = function()
                        require('lspconfig').ts_ls.setup({
                            settings = {
                                typescript = {
                                    format = {
                                        indentSize = 2,
                                    }
                                }
                            }
                        })
                    end,
                }
            })
        end
    }
}
