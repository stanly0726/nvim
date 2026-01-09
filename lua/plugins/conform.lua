---@module "lazy"
---@type LazySpec
return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
        require("conform").setup(opts)
        local settings = require("core.settings")

        vim.g.disable_autoformat = not settings["format_on_save"]

        vim.api.nvim_create_user_command("FormatToggle", function(args)
            local is_global = not args.bang
            if is_global then
                vim.g.disable_autoformat = not vim.g.disable_autoformat
                if vim.g.disable_autoformat then
                    print("Autoformat-on-save disabled globally")
                else
                    print("Autoformat-on-save enabled globally")
                end
            else
                vim.b.disable_autoformat = not vim.b.disable_autoformat
                if vim.b.disable_autoformat then
                    print("Autoformat-on-save disabled for this buffer")
                else
                    print("Autoformat-on-save enabled for this buffer")
                end
            end
        end, {
            desc = "Toggle autoformat-on-save",
            bang = true,
        })
    end,
    opts = {
        formatters_by_ft = {
            -- lua = { "stylua" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            -- rust = { "rustfmt", lsp_format = "fallback" },
            yaml = { "prettierd" },
            markdown = { "prettierd" },
        },
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            else
                return {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                }
            end
        end,
    }
}
