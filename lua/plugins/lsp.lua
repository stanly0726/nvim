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
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required

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
        local cmp_action = require('lsp-zero').cmp_action()
        local luasnip = require("luasnip")

        -- set autopairs to work with cmp
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        require('luasnip.loaders.from_vscode').lazy_load()
        cmp.setup({
            mapping = {
                    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                    ['<CR>'] = nil,
                    ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = false })
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }
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

        lsp.setup()
    end
}
