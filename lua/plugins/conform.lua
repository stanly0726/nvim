---@module "lazy"
---@type LazySpec
return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            -- lua = { "stylua" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            -- rust = { "rustfmt", lsp_format = "fallback" },
            yaml = { "prettierd" },
            markdown = { "prettierd" },
  
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        }
    }
}