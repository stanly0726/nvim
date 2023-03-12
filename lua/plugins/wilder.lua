return {
    'gelguy/wilder.nvim',
    event = "CmdlineEnter",
    dependencies = { "romgrk/fzy-lua-native", build = "make" },
    config = function()
        local wilder = require('wilder')
        wilder.setup({ modes = { ':', '/', '?' } })
        -- Disable Python remote plugin
        wilder.set_option('use_python_remote_plugin', 0)

        wilder.set_option('pipeline', {
            wilder.branch(
                wilder.cmdline_pipeline({
                    fuzzy = 1,
                    fuzzy_filter = wilder.lua_fzy_filter(),
                }),
                wilder.vim_search_pipeline()
            )
        })

        local highlighters = {
            wilder.pcre2_highlighter(),
            wilder.lua_fzy_highlighter(),
        }

        local popupmenu_renderer = wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme({
                border = 'rounded',
                empty_message = wilder.popupmenu_empty_message_with_spinner(),
                highlighter = highlighters,
                left = {
                    ' ',
                    wilder.popupmenu_devicons(),
                    wilder.popupmenu_buffer_flags({
                        flags = ' a + ',
                        icons = { ['+'] = '', a = '', h = '' },
                    }),
                },
                right = {
                    ' ',
                    wilder.popupmenu_scrollbar(),
                },
            })
        )

        local wildmenu_renderer = wilder.wildmenu_renderer({
            highlighter = highlighters,
            separator = ' · ',
            left = { ' ', wilder.wildmenu_spinner(), ' ' },
            right = { ' ', wilder.wildmenu_index() },
        })

        wilder.set_option('renderer', wilder.renderer_mux({
            [':'] = popupmenu_renderer,
            ['/'] = wildmenu_renderer,
            substitute = wildmenu_renderer,
        }))
    end
}
