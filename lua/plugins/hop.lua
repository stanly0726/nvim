return {
    'smoka7/hop.nvim',
    event = "BufReadPost",
    keys = {
        { ',', function()
            local hop = require("hop")
            hop.hint_char1()
        end, { remap = true } },
        { '<leader>,', function()
            local hop = require("hop")
            hop.hint_char2()
        end, { remap = true } },
        {
            'f',
            function()
                local hop = require("hop")
                local directions = require("hop.hint").HintDirection
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end,
            mode = { 'n', 'x' },
            { remap = true }
        },
        {
            'F',
            function()
                local hop = require("hop")
                local directions = require("hop.hint").HintDirection
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end,
            mode = { 'n', 'x' },
            { remap = true }
        },
        {
            't',
            function()
                local hop = require("hop")
                local directions = require("hop.hint").HintDirection
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end,
            mode = { 'n', 'x' },
            { remap = true }
        },
        {
            'T',
            function()
                local hop = require("hop")
                local directions = require("hop.hint").HintDirection
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
            end,
            mode = { 'n', 'x' },
            { remap = true }
        }
    },
    opts = {
        create_hl_autocmd = false,
        keys="hklyuiopnm,qwertzxcvbasdgjf;"
    }
}
