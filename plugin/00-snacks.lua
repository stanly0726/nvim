vim.pack.add({ 'https://github.com/folke/snacks.nvim' })
require('snacks').setup({
    picker = {
        sources = {
            git_log = {
                confirm = function(picker, item)
                    picker:close()
                    require("gitsigns").show_commit(item.commit)
                end
            }
        }
    },
    indent = {
        animate = {
            enabled = false
        }
    },
    scroll = {
        animate = {
            easing = "inOutSine",
        }
    },
    statuscolumn = {
        folds = {
            git_hl = true,
            open = true,
        },
    },
})


vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find: file" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Find: Buffers" })

vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Search: Help Pages" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Search: Keymaps" })
vim.keymap.set("n", "<leader>sw", function() Snacks.picker.grep({ hidden = true }) end,
    { desc = "Search: Word(workspace)" })
vim.keymap.set("n", "<leader>sW", function() Snacks.picker.grep_word({ hidden = true }) end,
    { desc = "Search: Word Under Cursor(workspace)" })

vim.keymap.set("n", "<leader>ss", function() Snacks.picker() end, { desc = "Snacks picker" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Snacks diagnostics" })
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "Explorer" })
