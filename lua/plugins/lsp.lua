---@module "lazy"
---@type LazySpec
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
            local settings = require("core.settings")

            local diagnostics_virtual_lines = settings.diagnostics_virtual_lines
            local diagnostics_level = settings.diagnostics_level
            local inlay_hint = settings.lsp_inlayhints

            require("mason-lspconfig").setup {
                ensure_installed = settings.lsp_deps
            }

            vim.diagnostic.config {
                signs = true,
                virtual_text = not diagnostics_virtual_lines,
                virtual_lines = diagnostics_virtual_lines and {
                    severity = {
                        min = vim.diagnostic.severity[diagnostics_level],
                    },
                } or false,
            }
            vim.lsp.inlay_hint.enable(inlay_hint)
        end
    },
}
