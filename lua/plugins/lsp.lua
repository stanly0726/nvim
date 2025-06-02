local settings = require("core.settings")

return {
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        dependencies = {
            {
                "mason-org/mason.nvim",
                config = true,
                cmd = 'Mason',
            },
            { "neovim/nvim-lspconfig" }
        },
        config = function()
            local diagnostics_virtual_lines = settings.diagnostics_virtual_lines
            local diagnostics_level = settings.diagnostics_level

            require("mason-lspconfig").setup {
                ensure_installed = settings.lsp_deps
            }

            vim.diagnostic.config {
                signs = true,
                virtual_text = true,
                virtual_lines = diagnostics_virtual_lines and {
                    severity = {
                        min = vim.diagnostic.severity[diagnostics_level],
                    },
                } or false,
            }
        end
    },
}
