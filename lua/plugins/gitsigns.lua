---@module "lazy"
---@type LazySpec
return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        current_line_blame = true,
    },
    keys = {
        { "<leader>gp", ":Gitsign preview_hunk<CR>", desc = "Gitsign: preview" },
        { "<leader>gs", ":Gitsign stage_hunk<CR>",   desc = "Gitsign: stage hunk",   mode = { 'n', 'x' } },
        { "]g",         ":Gitsign next_hunk<CR>",    desc = "Gitsign: next hunk" },
        { "[g",         ":Gitsign prev_hunk<CR>",    desc = "Gitsign: previous hunk" },
    }
}
