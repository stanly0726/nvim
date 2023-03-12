return {
    'j-hui/fidget.nvim',
    event = "LspAttach",
    opts = function()
        vim.api.nvim_set_hl(0, "FidgetTitle", { link = "Title" })
        vim.api.nvim_set_hl(0, "FidgetTask", { link = "LineNr" })

        return {
            window = {
                blend = 0,
            }
        }
    end
}
