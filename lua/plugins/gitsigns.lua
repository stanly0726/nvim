return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        current_line_blame = true,
    },
    keys = {
        { "<leader>gp", ":Gitsign preview_hunk<CR>", desc = "Gitsign: preview" },
        { "]g",         ":Gitsign next_hunk<CR>",    desc = "Gitsign: next hunk" },
        { "[g",         ":Gitsign prev_hunk<CR>",    desc = "Gitsign: previous hunk" },
    }
}
