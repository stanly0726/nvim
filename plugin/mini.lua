vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.icons').setup()
-- require('mini.files').setup( -- No need to copy this inside `setup()`. Will be used automatically.
--     {
--         -- Module mappings created only inside explorer.
--         -- Use `''` (empty string) to not create one.
--         mappings = {
--             close       = 'q',
--             go_in       = '<Right>',
--             go_in_plus  = '<CR>',
--             go_out      = '<Left>',
--             go_out_plus = 'H',
--             mark_goto   = "'",
--             mark_set    = 'm',
--             reset       = '<BS>',
--             reveal_cwd  = '@',
--             show_help   = 'g?',
--             synchronize = '=',
--             trim_left   = '<',
--             trim_right  = '>',
--         },
--
--         -- General options
--         options = {
--             -- Whether to delete permanently or move into module-specific trash
--             permanent_delete = false,
--         },
--
--         -- Customization of explorer windows
--         windows = {
--             -- Maximum number of windows to show side by side
--             max_number = math.huge,
--             -- Whether to show preview of file/directory under cursor
--             preview = true,
--         },
--     })
--
-- vim.keymap.set('n', '-', function()
--     MiniFiles.open()
-- end, { desc = "Mini.File: open menu" })

vim.api.nvim_create_autocmd('BufRead', {
    once = true,
    callback = function()
        require('mini.ai').setup()
        require('mini.surround').setup()
        require('mini.pairs').setup({ modes = { command = true } })
    end
})
