return {
    'phaazon/hop.nvim',
    branch = 'v2',
    event = "BufReadPost",
    keys = {
        { 'f', function()
            local hop = require("hop")
            local directions = require("hop.hint").HintDirection
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, { remap = true } },
        { 'F', function()
            local hop = require("hop")
            local directions = require("hop.hint").HintDirection
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, { remap = true } },
        { 't', function()
            local hop = require("hop")
            local directions = require("hop.hint").HintDirection
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end, { remap = true } },
        { 'T', function()
            local hop = require("hop")
            local directions = require("hop.hint").HintDirection
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end, { remap = true } }
    },
    opts = {
        create_hl_autocmd = false,
    }
}
