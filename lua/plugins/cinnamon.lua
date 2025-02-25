return {
    'declancm/cinnamon.nvim',
    enabled = false,
    lazy = false,
    -- event = "VeryLazy",
    config = function()
        require("cinnamon").setup {
            keymaps = {
                basic = true,
                extra = true,
            },
        }

        vim.keymap.set("n", "<C-f>", ":!tmux neww ~/.local/bin/tmux-sessionizer<CR><CR>",
            {
                noremap = false,
                silent = true,
                expr = false,
                nowait = false,
                callback = nil,
                desc = "tmux-sessionizer",
            }
        )
    end,
}
