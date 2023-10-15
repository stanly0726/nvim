return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        version = false,
        event = 'InsertEnter',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
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

            lsp_zero.extend_cmp({
                set_lsp_source = false,
                set_mappings = false,
            })

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
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'rust_analyzer',
                    'lua_ls',
                    "tsserver",
                    "tailwindcss",
                    "cssls",
                    "pylsp"
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
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
                    tsserver = function()
                        require('lspconfig').tsserver.setup({
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
