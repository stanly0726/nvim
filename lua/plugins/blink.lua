---@module "lazy"
---@type LazySpec
return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    event = 'InsertEnter',
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'default',
            ['<C-e>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-p>'] = { 'cancel' },
        },

        completion = {
            menu = {
                draw = {
                    columns = { { "label" }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
            ghost_text = { enabled = true },
            list = {
                selection = {
                    auto_insert = false
                }
            },
        },
    },
    opts_extend = { "sources.default" }
}
